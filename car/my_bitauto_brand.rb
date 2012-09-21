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
	detail_url = "#{brand.url}"
	puts "#{i} : #{detail_url}"
	@doc = Nokogiri::HTML(open(detail_url).read.strip)
	
	#logo_url = @doc.at_xpath('//div[@class = "line_box"]//img/@src')
	logo_url = @doc.at_css('div.logo_story > dl > dt > img').attr("src")
	brand_summary = @doc.at_css('div#aa').text.strip_tag.strip
	logo_summary = @doc.at_css('div#bb').text.strip_tag.strip
	name_pinyin = Pinyin.t(brand.name, '').downcase.to_s 
	
	
	pp logo_url
	
	@file_to_write.puts "#{i}\t#{brand.name}\t#{name_pinyin}\t#{brand_summary}\t#{logo_summary}\t#{logo_url}"
	break


end