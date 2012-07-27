#encoding: UTF-8
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

module Item
	class ItemUrl
	    attr_reader :domain, :id, :before_str
        attr_reader :end_string
		
        def initialize(id)
			@domain = $domain 
			@before_str = $before_str
            @end_str = $end_str 
            @id = id.to_s
        end
		
		def item_url
			"#{@domain}#{@before_str}#{@id}#{@end_str}"
		end

	end #end ItemUrl
	
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
		def initialize(url, from_encode)
            @url = url
            define_max_retry_time
            define_page_css
            define_content_css
			get_htmlstream(from_encode)
			exit if @html_stream.nil?
            #get_nokogiri_doc
            #exit if @doc.nil?
            log_or_output_info
        end #initialize 
		
		
		#变量定义
		def define_max_retry_time
            @retry_time = 3
        end #define_max_retry_time
        def define_page_css
            @page_css = %q[div.page]
        end #define_page_css
        def define_content_css
            @content_css = %q[li.at.c.h2]
        end #define_content_css
		#变量定义=====End
		
        def get_htmlstream(from_encode, to_encode = "UTF-8")
            times = 0
            begin
				@html_stream = open(@url).read.strip
				@html_stream.encode!(to_encode, from_encode) if from_encode != "UTF-8"
				#('UTF-8', :undef => :replace, :invalid => :replace, :replace => "")
            rescue
                @@log.error "Can Not Open [#{@url}]" if @@log
                times += 1
                retry if(times < @retry_time)
            end #begin
						
        end #get_htmlstream
		
		def get_nokogiri_doc
			@doc = Nokogiri::HTML(@html_stream)
		end #get_nokogiri_doc

		def get_html_item &blk
			puts @url
			puts @html_stream.length
			
			if block_given?	
				blk.call([@url, @html_stream])			
			else
				puts lists.length
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
                logger_file = IoFactory.init('./log.txt')
                logger = Logger.new logger_file
                ContentWorker.log = logger
            end #init_logger
			
			def get_item_url(id)
				@item_url = ItemUrl.new(id).item_url
			end
			
			def save_html_db(from_id)
				from_id.upto($end_page) do |i|
					get_item_url(i)
					ContentWorker.new(@item_url, "GBK").get_html_item do |c|
						car = $ItemClass.find_or_create_by(url: c[0])
						cache_html = $ItemCache.find_or_create_by(url: c[0])
						cache_html.name = i.to_s
						cache_html.url = car.url
						cache_html.value = c[1]
						car.cache_html = cache_html
						puts c[1].length
						
						car.name = i
						car.save
					end
				end
			end
			
	end
	
end
begin_time = Time.now
$domain = %q[http://data.auto.qq.com/car_models/]
$before_str = ""
$end_str = '/index.shtml'
$begin_page =  5407 #5406 
$end_page = 5408 #15057
$ItemClass = Qqcar
$ItemCache = QqCacheHtml
#$ItemQqCache = qq_cache_html

include Item
id = 5407
Runner.go(id)

puts Car.all.size
puts begin_time
puts Time.now
