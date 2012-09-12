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
	file_path = File.join('.', "baoyang-#{Time.now.to_formatted_s(:number) }.txt")
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write

@brand = Brand.bitautocar
@total = @brand.count

@url_items = []

@brand.each_with_index do |brand, i|
	detail_url = "#{brand.url}baoyang/"
	puts "#{i} : #{detail_url}"
	next if i < 101
	brand.makers.each do |maker|
		puts "#{brand.name}-#{maker.name}"
	
		@make = CarMaker.find_or_create_by(name: maker.name)
		@make.brand_name = brand.name
		@make.maker_name = maker.name

		maker.serials.each do |s|
		
			baoyang_url = s["href"] + "baoyang/"
			@doc = Nokogiri::HTML(open(baoyang_url).read.strip)
			link = @doc.at_xpath('//ul[@class = "tab"]/li[@class = "on"]/a/@href')
			unless link.nil?
				pp link
				@car_serial = CarSerial.new
				@car_serial.name = s["name"]
				@car_serial.type = s["title"]
				@car_serial.url = s["href"] + "baoyang/"
				@car_serial.baoyangzhouqi = @doc.at_xpath('//table[@id = "DataMaintainTable_0"]').to_s
				@car_serial.baoyangjiage =  @doc.at_xpath('//table[@id = "DataMaintainTablePrice_0"]').to_s
				@car_serial.bangyangurl = baoyang_url

				@make.car_serials.push(@car_serial)
				
				
			end
			@make.save
		end
	end


end