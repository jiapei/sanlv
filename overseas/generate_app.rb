#encoding: UTF-8
require 'rubygems'
require 'mongoid'
require 'nokogiri'
require 'open-uri'
require 'pp'



Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end

ENV['MONGOID_ENV'] = 'aap'

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


  def safe_open(url, retries = 5, sleep_time = 0.42,  headers = {})
    begin  
      html = open(url).read  
		rescue StandardError,Timeout::Error, SystemCallError, Errno::ECONNREFUSED #有些异常不是标准异常  
      puts $!  
      retries -= 1  
      if retries > 0  
        sleep sleep_time and retry  
      else  
				#logger.error($!)
				#错误日志
        #TODO Logging..  
      end  
    end
  end
  

def create_file_to_write
	file_path = File.join('.', "aap-#{Time.now.to_formatted_s(:number) }.txt")
	@file_to_write = IoFactory.init(file_path)
end #create_file_to_write

create_file_to_write



names = [
"Bolt Hole Quantity:",
"Brake Drum Outside Diameter:",
"Brake Surface Inside Diameter:",
"Brake Surface Width:",
"Material:",
"Outside Diameter:",
"Rust Resistant Coating:",
"Slotted:",
"Solid Or Vented Rotor:",
"Thickness:",
"Bolt Circle Diameter:",
"Finish:",
"Height:",
"OE Replacement:",
"Bolt Hole And Circle Diameter:",
"Outside Diameter (Inches):",
"Outside Diameter (Millimeters):",
"Height (Inches):",
"Height (Millimeters):",
"Thickness (Inches):",
"Thickness (Millimeters):",
"Thickness :",
"Brake Drum Inside Diameter:",
"Brake Surface Finish:",
"Cooling Fins:",
"Solid Or Vented:",
"Wheel Studs Included:",
"Exterior Finish:",
"Number of Bolt Holes:",
"Brake Shoe Size:",
"Wheel Stud Quantity:",
"Brake Drum Diameter:",
"Brake Surface Diameter:"]

	
Aap.all.each do |aap|

	item = "#{aap.title}\t#{aap.part_no}\t"
	
	names.each do |t|
		aap.parameters.each do |p|
			item << "#{p.value}" if (t.eql?(p.name))
		end	
		item << "\t"
	end
	
	@file_to_write.puts item
	
end

