#encoding: UTF-8
require 'mongoid'
require 'rubygems'
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
	file_path = File.join('.', "task-#{Time.now.to_formatted_s(:number) }.txt")
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write

@url = "http://car.bitauto.com/brandlist.html"
headers = {"User-Agent" => "google",
    "From" => "google",
    "Referer" => "http://www.google.com/"}


html_stream = open(@url, headers).read.strip
#html_stream.encode!('utf-8', 'gbk')


@doc = Nokogiri::HTML(html_stream)
puts @doc.at_css("title").text()

#rows =  @doc.xpath('//div[@class = "pic"]/a/img/@src')
brand_rows =  @doc.xpath('//dd[@class = "b"]/div[@class = "brandname"]')
maker_rows =  @doc.xpath('//dd[@class = "have"]')

puts brand_rows.length
puts maker_rows.length


maker_rows.each_with_index do |row, i|
	@brand = Brand.new
	@brand.name = brand_rows[i].at_xpath('a[1]/text()').to_s 
	@brand.url = "http://car.bitauto.com" + brand_rows[i].at_xpath('a[1]/@href').to_s 
	@brand.name_pinyin = Pinyin.t(@brand.name, '').downcase.to_s 

    @brand.pic_url = ''
    @brand.tip = 'bitautocar'
	
	maker_num = row.xpath('h2').length
	
	puts maker_num
	1.upto(maker_num) do |i|
		@maker = Maker.new
		@maker.name =  row.at_xpath("h2[#{i}]/a[1]/text()").to_s
		items = []		
		row.xpath("ul[#{i}]/li").each do |s|
			item = {}	
			item = {name: s.at_xpath("div[1]/a[1]/text()").to_s, title: s.at_xpath("div[1]/a[2]/text()").to_s,  href: "http://car.bitauto.com" + s.at_xpath("div[1]/a[1]/@href").to_s}
			items << item
		end
		@maker.serials = items
		@brand.makers << @maker
	end
	
	@brand.save()
	#pp @brand.makers
	#break

=begin
	details = []
	[
		[:name, 'tr[1]/td[1]/span[1]/text()'],
		[:style, 'tr[1]/td[1]/span[2]/text()'],
		[:cars, 'tr[2]/td[1]/ul[1]/li[1]'],
		[:s1, 'tr[2]/td[1]/ul[1]/li[2]'],
		[:s2, 'tr[2]/td[1]/ul[1]/li[3]'],
	].each do |name, xpath|
		puts "#{name}:- #{row.at_xpath(xpath).to_s.strip_tag.strip}"
		details << row.at_xpath(xpath).to_s.strip_tag.strip 
	end
    #TaskData.find_or_create_by(name: "Photek")
=end
  #@file_to_write.puts  row
end
