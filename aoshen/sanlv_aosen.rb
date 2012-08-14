#encoding: utf-8
require 'rubygems'
require 'open-uri'
require 'nokogiri'

class String
    def br_to_new_line
        self.gsub('<br>', "\n")
    end
    def n_to_nil
        self.gsub('\n', "")
    end	
    def strip_tag
        self.gsub(%r[<[^>]*>], '')
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
	file_path = File.join('.', 'aosenlists.txt')
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write
@url = "http://www.globalaosen.com/Products.asp?classID=17&page=2"
headers = {"User-Agent" => "google",
    "From" => "google",
    "Referer" => "http://www.google.com/"}
#17 1..12	
#18 1..29
#19 1..20
#20 1..15
5.upto(15) do |i|
	@url = "http://www.globalaosen.com/Products.asp?classID=20&page=#{i}"
	html_stream = open(@url, headers).read.strip
	html_stream.encode!('utf-8', 'gbk')


	@doc = Nokogiri::HTML(html_stream)
	puts @doc.at_css("title").text()

	rows =  @doc.xpath('//td[@class = "proIMG"]/a/@href')

	puts rows.length

	rows.each do |row|
	  @file_to_write.puts  "http://www.globalaosen.com/#{row.to_s.strip_tag.strip}"


	  #puts row.to_s.strip_tag.strip
	end
end
#@file_to_write.puts  html_stream.gsub(/^\<ID\>(.*)\<\/ID$/) {$1}

#scan(/\d{9}/).collect { |p| p.to_s[0, 6] }.join(' ')



 