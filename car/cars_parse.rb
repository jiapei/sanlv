#encoding: utf-8
require 'mongoid'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'logger'


Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end


ENV['MONGOID_ENV'] = 'development'

Mongoid.load!("config/mongoid.yml")

# item = HtmlContent.new
# t = {:url => 'url', :content => 'content', :type => 'type', :status => 'status'}
# item.update_attributes(t)

#http://data.auto.sina.com.cn/car/1014
#http://data.auto.sina.com.cn/car/10230


module ItemParse
	
	class ContentWorker
        attr_reader :url, :doc, :retry_time
        attr_accessor :page_css, :content_css
		#日志操作		
        class << self
            def log=(log_file)
                @@log = log_file
            end #log=
            def log
                @@log
            end
        end #class
		def log_or_output_info
            msg = "processing #{@url}"
            if @@log
                @@log.debug msg
            else
                puts msg
            end #if
        end #log_or_output_info
		#日志操作====End
		#初始化
		def initialize(id)
            
            define_single_css
            define_mulit_css
			
			get_htmlstream(id)
            get_nokogiri_doc
            exit if @doc.nil?
            log_or_output_info
        end #initialize 
		
		
		#变量定义
        def define_single_css
			@single_css ={}
            @single_css ={车型: %q[h1], 市场均价: %q[div.price b] } #
        end #define_single_css
		
        def define_mulit_css
            @mulit_css = {相关车型: %q[div.relation_tx ul li],  基本参数: "div.conshow p" }
        end #define_mulit_css
		#变量定义=====End
		
		def get_htmlstream(id)
			@car = Car.where(item_id: "sina_car_#{id}").first #.update(label: "doing")
			p @car.url
			@html_stream = @car.html_content
		end
		
		def get_nokogiri_doc
			@doc = Nokogiri::HTML(@html_stream)
		end #get_nokogiri_doc

		def get_struct_data &blk
			puts "get the struct data......"
			@car.update_attributes({price: 14 , factory: "捷豹"})
			
			if block_given?	
				blk.call()			
			else
				puts @car.price
			end
			
			
		end		
		
	end #end of ContentWorker
    
	
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
	
	class Runner
			attr_reader :url_builder, :start_url
            attr_reader :total_page, :file_to_write

            def initialize id
                init_logger
				save_html_db(id)
				
            end #initialize

            def self.go(id)
                self.new(id)
            end	
			
			
			def init_logger
                logger_file = IoFactory.init('./cars_parse_log.txt')
                logger = Logger.new logger_file
                ContentWorker.log = logger
            end #init_logger
			
			def get_item_url(id)
				@item_url = ItemUrl.new(id).item_url
			end
			
			def save_html_db(id)
				ContentWorker.new(id).get_struct_data 
			end
			
	end
	
end
include ItemParse
id = 1020
to_id = 10230
Runner.go(id)


puts Car.all.size
