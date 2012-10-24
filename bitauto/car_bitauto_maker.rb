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
	file_path = File.join('.', 'maker_url_list.txt')
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write
@url = "http://car.bitauto.com/brandlist.html"
html_stream = open(@url).read.strip
@doc = Nokogiri::HTML(html_stream)
rows = @doc.xpath('//h2/a/@href')
puts rows.length

rows.each do |row|
  @file_to_write.puts  "http://car.bitauto.com#{row}"


  #puts row.to_s.strip_tag.strip
end

#@file_to_write.puts  html_stream.gsub(/^\<ID\>(.*)\<\/ID$/) {$1}

#scan(/\d{9}/).collect { |p| p.to_s[0, 6] }.join(' ')



 