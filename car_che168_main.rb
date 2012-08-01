#encoding: utf-8
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'logger'
require 'pp'

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
module SanLv
    class UrlBuilder
        attr_reader :domain, :id
        attr_reader :end_type
        def initialize id
			@domain = %q[http://www.szxdc.net/Products]
            @end_type = '_qc.html'
            @id = id.to_s
        end
		
		def first_page_url
            @domain + @end_type
        end #first_page_url
        
        def build_page_url page
            page = page.to_s
            "#{@domain}#{page}#{@end_type}"
        end #build_page_url      
    end #UrlBuilder
    
	class ContentWorker
        attr_reader :url, :doc, :retry_time
        attr_accessor :page_css, :content_css
        class << self
            def log=(log_file)
                @@log = log_file
            end #log=
            def log
                @@log
            end
        end #class
		
        def initialize url
            @url = url
            define_max_retry_time
            define_page_css
            define_content_css
            get_nokogiri_doc
            exit if @doc.nil?
            log_or_output_info
        end #initialize     
		
        def log_or_output_info
            msg = "processing #{@url}"
            if @@log
                @@log.debug msg
            else
                puts msg
            end #if
        end #log_or_output_info
        def get_nokogiri_doc
            times = 0
			from_encode ="gbk"
			to_encode = "utf-8"

            begin
				html_stream = open(@url).read.strip
				html_stream.encode!(to_encode, from_encode)
                @doc = Nokogiri::HTML(html_stream)
            rescue
                @@log.error "Can Not Open [#{@url}]" if @@log
                times += 1
                retry if(times < @retry_time)
            end #begin
        end #get_nokogiri_doc
        def define_max_retry_time
            @retry_time = 3
        end #define_max_retry_time
		
        def define_page_css
            @page_css = %q[div.page]
        end
        def define_content_css
            @content_css = %q[li.at.c.h2]
        end #define_content_css
		
        def total_page
            #page = ''
            #doc.css(page_css).each do |p|
            #    m = p.content.match(/，\d+/)[0].match(/\d+/)  
            #    page = m[0] if m                                
            #end #each
            #page.to_i
			38
        end #total_page
		
		def build_lists &blk
			puts "采集列表页"
			lists = []

			@doc.css("table.STYLE1 > tr > td > a").each do |item|
				lists << ["pic", "http://www.rizuan.com/" + item.attr("href")]
			end

			
			if block_given?	
				blk.call(lists)			
			else
				puts lists.length
			end	
		end
		
		def build_content &blk
		
			rows = @doc.xpath('//ul[@class="bigpic_ul"]/li')
				rows.collect do |row|

					details = []
					[
						[:href, 'a[1]/@href'],
						[:name, 'div[1]/a/text()'],
						[:price, 'div[2]/span[1]'],
						[:year, 'div[3]'],
					].each do |name, xpath|
						details << row.at_xpath(xpath).to_s.strip_tag.strip 
					end #end []
					pp details
					if block_given?	
						blk.call(details[0] + "\t" + details[1] + "\t" + details[2] + "\t" + details[3] )
					else
						pp details
					end
 				end #end rows

		end #build_content
    end #ContentWorker

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
				create_file_to_write id             
                output_content
            end #initialize

            def self.go(id)
                self.new(id)
            end

            def create_file_to_write id
                file_path = File.join('.', id.to_s.concat('.txt'))
                @file_to_write = IoFactory.init(file_path)
            end #create_file_to_write

            def init_logger
                logger_file = IoFactory.init('./log.txt')
                logger = Logger.new logger_file
                ContentWorker.log = logger
            end #init_logger


            def output_content              
				1.upto(828) do |i|
                    list_url = "http://www.che168.com/china/list/?page=#{i}"
					puts "content_page: #{list_url}" 
                    ContentWorker.new(list_url).build_content do |cc|
								@file_to_write.puts cc
								#@file_to_write.puts '*' * 40
							end # build_content					
						
                end #for each


            end #output_content

    end #Runner

end #SanLv

include SanLv

id = 828

Runner.go id
 