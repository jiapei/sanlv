#encoding: UTF-8
require 'rubygems'
require 'mongoid'
require 'nokogiri'
require 'open-uri'
require 'pp'



Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end

ENV['MONGOID_ENV'] = 'aap'

Mongoid.load!("config/mongoid.yml")
class String
    def br_to_new_line
        self.gsub('<br>', "\n")
    end
    def n_to_nil
        self.gsub('\n', "")
    end	
    def strip_tag
        self.gsub(%r[<[^>]*>], '').gsub(/\t|\n|\r/, ' ')
    end
end #String
class IoFactory
	attr_reader :file
	def self.init file
		@file = file
		if @file.nil?
			puts 'Can Not Init File To Write'
			exit
		end #if
		File.open @file, 'a'
	end     
end #IoFactory
def safe_open(url, retries = 5, sleep_time = 0.42,  headers = {})
    begin  
      html = open(url).read  
		rescue StandardError,Timeout::Error, SystemCallError, Errno::ECONNREFUSED #有些异常不是标准异常  
      puts $!  
      retries -= 1  
      if retries > 0  
        sleep sleep_time and retry  
      else  
				#logger.error($!)
				#错误日志
        #TODO Logging..  
      end  
    end
  end
def create_file_to_write
	file_path = File.join('.', "aap-#{Time.now.to_formatted_s(:number) }.txt")
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write


#http://shop.advanceautoparts.com/webapp/wcs/stores/servlet/FetchVehicleDetailsView?YMMEAction=wantMake&vehicleType=3&year=2013&storeId=10151&catalogId=10051&langId=-1
#1942
@first_time = Time.now.to_formatted_s(:number)
@total_open = 0
@total_car = 0
2011.downto(1942) do |year|
	puts year
	#get maker from year
	url =  "http://shop.advanceautoparts.com/webapp/wcs/stores/servlet/FetchVehicleDetailsView?YMMEAction=wantMake&vehicleType=3&year=#{year}&storeId=10151&catalogId=10051&langId=-1"
	url =URI.parse(URI.encode(url))
	@total_open += 1
	html_stream = safe_open(url , retries = 3, sleep_time = 0.42, headers = {})
	doc = Nokogiri::HTML(html_stream)
		#pp doc
		doc.xpath("//option").each_with_index do |item, i|
			maker =  item.at_xpath("text()").to_s
			next if i== 0
			#get model from maker . year
			model_url = "http://shop.advanceautoparts.com/webapp/wcs/stores/servlet/FetchVehicleDetailsView?YMMEAction=wantModel&vehicleType=3&year=#{year}&make=#{maker}&storeId=10151&catalogId=10051&langId=-1"
			model_url = URI.parse(URI.encode(model_url))
			@total_open += 1
			model_stream = safe_open(model_url , retries = 3, sleep_time = 0.42, headers = {})
			model_doc =  Nokogiri::HTML(model_stream)
			model_doc.xpath("//option").each_with_index do |model_item, j|
				#pp model_item
				#puts model_item.at_xpath("text()").to_s
				model = model_item.at_xpath("text()").to_s
				next if j== 0
				engine_url = "http://shop.advanceautoparts.com/webapp/wcs/stores/servlet/FetchVehicleDetailsView?YMMEAction=wantEngine&vehicleType=3&year=#{year}&make=#{maker}&model=#{model}&storeId=10151&catalogId=10051&langId=-1"
				engine_url = URI.parse(URI.encode(engine_url))
				@total_open += 1
				engine_stream = safe_open(engine_url , retries = 3, sleep_time = 0.42, headers = {})
				engine_doc = Nokogiri::HTML(engine_stream)
				engine_doc.xpath("//option").each_with_index do |engine_item, k|
					next if (engine_item.at_xpath("text()").to_s.strip == "Select Engine")
					engine =  engine_item.at_xpath("text()").to_s
					vehcle =  engine_item.at_xpath("@value").to_s
					vehcleID = vehcle.split(/:/)[0]
					vehcleCODE = vehcle.split(/:/)[1]
					puts "#{vehcle} - #{vehcleID} - #{vehcleCODE}"
					
					@car = Car.find_or_initialize_by(engine_url: engine_url)
					@car.year = year
					@car.maker = maker
					@car.model = model
					@car.engine = engine
					@car.vehicle_id = vehcleID
					@car.vehicle_code = vehcleCODE
					@car.maker_url = url
					@car.model_url = model_url
					@car.engine_url = engine_url
					@car.save
					#pp @car
					
					@total_car += 1
					puts "#{year}-#{i}-#{j}-#{k}"
					
					@file_to_write.puts "#{year}\t#{maker}\t#{model}\t#{engine}\t#{vehcleID}\t#{vehcleCODE}"
					
				end
			end
			
		end
		
end 
@last_time = Time.now.to_formatted_s(:number)

puts "open: #{@total_open} - cars: #{@total_car}"
puts "from: #{@first_time} - to: #{@last_time}"
