#encoding: UTF-8
require 'rubygems'
require 'mongoid'
require 'nokogiri'
require 'open-uri'
require 'logger'
require 'pp'
require 'chinese_pinyin'

Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end


#ENV['MONGOID_ENV'] = 'localcar'
ENV['MONGOID_ENV'] = 'development'

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

def create_file_to_write
	file_path = File.join('.', "error-#{Time.now.to_formatted_s(:number) }.txt")
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write


@bitautocar = Qqcar.bitautocar
@total = @bitautocar.count

@bitautocar.each_with_index do |car, i|
	detail_url = car.url
	puts "#{i} : #{detail_url}"
	if i < 243
		next
	end
	@doc = Nokogiri::HTML(open(detail_url).read.strip) 
	
	@details = []
	@doc.xpath('//div[@class = "line_box car_config"]/table/tbody/tr').each_with_index do |item, ii|
		puts "#{i}/#{@total} - #{ii} "
		[
		["th[1]/text()" , "td[1]"],
		["th[2]/text()" , "td[2]"],
		].each do |name, value|
			n = item.at_xpath(name).to_s
			v = item.at_xpath(value).to_s.strip_tag.strip
			
			unless n.eql?("")
				#puts "#{n} \t #{v}"
				para = Parameter.new()
				para.name = n
				para.value = v
				@details << para
			end
		end

	end

	car.parameters = @details
	car.save

#	break
end

