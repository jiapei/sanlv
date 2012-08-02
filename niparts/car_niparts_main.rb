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
        attr_reader :domain, :id, :article
        attr_reader :end_type
        def initialize id
			# 80 空滤 101 机滤 127汽滤
			@domain = %q[http://www.jarparts.com/Products_indexlist.asp?lang=CN&page=]
			@article = 'article'
            @end_type = '&SortID=127&keys='
            @id = id.to_s
        end     
        def article_url
            @domain + id + @end_type
        end #article_url        
        def build_article_url page
            page = page.to_s
            "#{@domain}#{page}#{@end_type}"
        end #build_article_url      
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
			from_encode ="utf-8"
			to_encode = "utf-8"

            begin
                @doc = Nokogiri::HTML(open(@url).read.strip)
				#@doc = @doc.encode!(to_encode, from_encode)
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
            @page_css = %q[div.pages span]
        end
        def define_content_css
            @content_css = %q[li.at.c.h2]
        end #define_content_cssea
		
        def total_page
			puts @url
            page = ''
            p = doc.at_css(@page_css) 
            m = p.content.match(/\/\d+/)[0].match(/\d+/)              
                page = m[0] if m                                
            page.to_i
        end #total_page
		
		def build_lists &blk
			lists = []

			@doc.css("div.pic").each do |item|
				lists << ["pic", "http://www.jarparts.com/" + item.at_css("a").attr("href")]
			end

			
			if block_given?	
				blk.call(lists)			
			else
				puts lists.length
			end
			
			
		end
		
        def build_content &blk
		
			rows = @doc.xpath('//div[@id="msg"]/dl/dd')
			details = rows.collect do |row|
				puts row
				puts "="*40
			  detail = row.to_s.strip_tag
			  puts detail
			  detail
			end
			details << @doc.at_xpath('//div[@class = "accordion"]').to_s.strip_tag
			f_url = @doc.xpath('//div[@class = "content"]/script[1]/@src').to_s
			f_doc = open(f_url).read.strip
			details << '厂家：' + f_doc.strip_tag
			pp details
			if block_given?	
				temp = "#{@url}\t"
				details.collect  do |p| 
					s = p
					#if(["类别" , "型号" , "适用车型" , "外型尺寸"].include? p.split(/：/)[0])
						temp << "#{s}\t"
					#end
				end
				blk.call(temp)
			else
				puts details
			end
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
                @url_builder = UrlBuilder.new(id)               
                get_start_url
				get_total_page
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

            def get_start_url               
                @start_url = @url_builder.article_url
            end #get_start_url

            def get_total_page
                @total_page = ContentWorker.new(@start_url).total_page
				@total_page = 1 if @total_page == 0
				puts @total_page.to_s + "pages"
                if @total_page.nil?
                    puts 'Can not get total page'
                    exit
                end #if

            end # get_total_page

            def output_content              
				@total_page.times do |part|
                    list_url = @url_builder.build_article_url(part+1)
					puts "list_page: #{list_url}" 
                    ContentWorker.new(list_url).build_lists do |c|
                        pp c
						c.each do |item|
							page_url =  item[1] #"http://www.litongly.cn/athena/offerdetail/sale/litongly-1032152-558158414.html"
							puts "-----page_url: #{page_url}"
							ContentWorker.new(page_url).build_content do |cc|
								@file_to_write.puts cc
								#@file_to_write.puts '*' * 40
							end # build_content
						end						
						
						
                    end # build_lists
                end #times
            end #output_content

    end #Runner

end #SanLv

include SanLv

id = 1

Runner.go id
 