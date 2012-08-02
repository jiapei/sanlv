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
	file_path = File.join('.', 'nipartslist.txt')
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write
@url = "http://www.niparts.com/Web/Include/GetCarType.aspx?sid=213&type=1"
html_stream = open(@url).read.strip
@doc = Nokogiri::XML(html_stream)
rows = @doc.xpath('//City/ID')
puts rows.length

rows.each do |row|
  @file_to_write.puts  "http://www.niparts.com/Control/Index/readtype.ashx?mfaid=#{row.to_s.strip_tag.strip}&type=0&carType=1&Couid=213"


  #puts row.to_s.strip_tag.strip
end

#@file_to_write.puts  html_stream.gsub(/^\<ID\>(.*)\<\/ID$/) {$1}

#scan(/\d{9}/).collect { |p| p.to_s[0, 6] }.join(' ')



 