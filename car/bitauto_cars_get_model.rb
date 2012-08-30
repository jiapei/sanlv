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

i = 0
serials = []

Brand.where({tip: "bitautocar"}).each do |b|
	b.makers.each do |m|
		m.serials.each do |s|
			item = {}
			i += 1
			href  = s["href"]
			item = { i: i, brand: b.name, brand_pinyin: b.name_pinyin, maker: m.name, series: s["name"], url: href}
			serials << item
		end
	end
end

puts serials.length


serials.each_with_index do |s, i|

	puts i.to_s + "\t" + s[:url]
	if i < 22
		next
	end
	@url = s[:url]
	headers = {"User-Agent" => "google",
		"From" => "google",
		"Referer" => "http://www.google.com/"}

	#html_stream = open(@url, headers).read.strip
	html_stream = open(@url).read.strip
	
	@doc = Nokogiri::HTML(html_stream)

	lists = @doc.xpath('//em[@class = "h3_spcar"]//a/@href')
	lists.each do |a|
		url =  "http://car.bitauto.com#{a}"
		puts url
		@list_doc = Nokogiri::HTML(open(url).read.strip) 

		year =  @list_doc.at_css("div#car_list > h3 > span").text.to(3)

		@list_doc.xpath('//table[@id = "compare"]/tr/td[1]/a').each do |item|
		
			#puts item.to_s.strip_tag
			#here get name, url, year
			name = item.to_s.strip_tag
			href = item.at_xpath('@href').to_s

			puts  "name : #{item.to_s.strip_tag}"
			puts  "href : #{item.at_xpath('@href')}"
			puts  "year : #{year}"

			@qqcar = Qqcar.find_or_create_by(url: href)
			@qqcar.name = name
			@qqcar.name_pinyin = Pinyin.t(name, '').downcase.to_s
			@qqcar.brand = s[:brand]
			@qqcar.series = s[:series]
			@qqcar.maker = s[:maker]
			@qqcar.year = year
			@qqcar.tip = "bitautocar"
			@qqcar.url = href
			#pp @qqcar
			@qqcar.save()			

		end

	end
  
	
end

