#encoding: UTF-8
require 'mongoid'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'logger'

Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end


ENV['MONGOID_ENV'] = 'localcar'

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
	file_path = File.join('.', 'task.txt')
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write

@url = "http://data.auto.qq.com/car_brand/index.shtml"
headers = {"User-Agent" => "google",
    "From" => "google",
    "Referer" => "http://www.google.com/"}


html_stream = open(@url, headers).read.strip
html_stream.encode!('utf-8', 'gbk')


@doc = Nokogiri::HTML(html_stream)
puts @doc.at_css("title").text()

#rows =  @doc.xpath('//div[@class = "pic"]/a/img/@src')
#rows =  @doc.xpath('//ul[@class = "cl"]/li')

#puts rows.length

#rows.each do |row|
#  @file_to_write.puts  row
#end
