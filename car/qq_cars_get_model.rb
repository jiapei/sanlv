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


ENV['MONGOID_ENV'] = 'localcar'
#ENV['MONGOID_ENV'] = 'development'

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

Brand.each do |b|
	b.makers.each do |m|
		m.serials.each do |s|
			item = {}
			i += 1
			href  = s["href"]
			item = { i: i, brand: b.name, brand_pinyin: b.name_pingyin, maker: m.name, series: s["name"], url: href}
			serials << item
			
		end
	end
end

puts serials.length

serials.each_with_index do |s, i|
	#get the url
	#pp  s
	puts i.to_s + "\t" + s[:url]
	#error 219      http://data.auto.qq.com/car_serial/742/index.shtml
	#error 460      
	#if i < 460
	#	next
	#end

	
	@url = s[:url]
	headers = {"User-Agent" => "google",
		"From" => "google",
		"Referer" => "http://www.google.com/"}

	#html_stream = open(@url, headers).read.strip
	html_stream = open(@url).read.strip
	begin
		html_stream.encode!('utf-8', 'gbk')
	rescue Encoding::InvalidByteSequenceError
		@file_to_write.puts "error from url : #{@url}"
		@file_to_write.puts $!
		p $!      #=> #<Encoding::InvalidByteSequenceError: "\xA1" followed by "\xFF" on EUC-JP>
		puts $!.error_bytes.dump          #=> "\xA1"
		puts $!.readagain_bytes.dump      #=> "\xFF"
		next

	end
	
	@doc = Nokogiri::HTML(html_stream)
	rows = @doc.xpath('//table[@class = "data4"]/tr')

	rows.each do |row|
		name = row.at_xpath('td[1]/a[1]/text()').to_s
		url = "http://data.auto.qq.com" + row.at_xpath('td[1]/a[1]/@href').to_s
		
		if name != ""
			puts name
			#puts "well"
			@qqcar = Qqcar.find_or_create_by(url: url)
			@qqcar.name = name
			@qqcar.name_pinyin = Pinyin.t(name, '').downcase.to_s
			@qqcar.brand = s[:brand]
			@qqcar.series = s[:series]
			@qqcar.maker = s[:maker]
			#@qqcar.url = url
			
			@qqcar.save()

		end
	end
	
	
	#break
	#@qqcar = Qqcar.new
	
end

