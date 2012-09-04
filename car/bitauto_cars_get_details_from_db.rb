#encoding: UTF-8
require 'rubygems'
require 'mongoid'
require 'nokogiri'
require 'open-uri'
require 'logger'



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
	file_path = File.join('.', "bitauto-#{Time.now.to_formatted_s(:number) }.txt")
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write


@bitautocar = Qqcar.bitautocar2
@total = @bitautocar.count
	@title = []
@bitautocar.each_with_index do |car, i|

	#if !car.title
	#	next
	#end
	puts "#{i}/#{@total}:#{car.brand}"

	item = "#{car.brand}\t#{car.maker}\t#{car.series}\t#{car.year}\t"
	car.parameters.each do |p|
		@title << p.name
	end
	@title = @title.uniq

	
	#break
end
	@file_to_write.puts @title
puts @title.count
