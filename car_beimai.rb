#encoding: utf-8
require 'rubygems'
require 'open-uri'

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
	file_path = File.join('.', 'beimailist.txt')
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write
@url = "http://www.beimai.com/pinpaidaquan.shtml"
html_stream = open(@url).read.strip

@file_to_write.puts  html_stream.scan(/\d{9}/).collect { |p| p.to_s[0, 6] }.join(' ')



 