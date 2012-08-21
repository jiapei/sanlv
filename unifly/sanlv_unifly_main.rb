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
        self.gsub(%r[<[^>]*>], '').gsub(/\t|\n|\r/, '')
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
			from_encode ="GBK"
			to_encode = "utf-8"

            begin
			html_stream = open(@url).read.strip
			#html_stream.encode!(to_encode, from_encode)
                @doc = Nokogiri::HTML(html_stream)
				#@doc = 
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
			#regEx = /getTypes\((.*)\);getTypePic/
			regEx = /\d+,'\w+'/

			@doc.css("table > tr").each do |item|
				temp = []
				temp << item.css("td")[1].text
				temp << item.css("td")[3].text
				urlstr = item.attr("onclick")
				if regEx =~ urlstr
				  lists << temp + regEx.match(urlstr).to_s.gsub('\'','').split(/,/)
				end		
				#puts lists
				#lists << [item., "http://www.jarparts.com/" + item.at_css("a").attr("href")]
			end

			
			if block_given?	
				blk.call(lists)			
			else
				puts lists.length
			end
			
			
		end
		
        def build_content &blk
		
			rows = @doc.xpath('//table[@class = "cpt_tb"]')
			puts rows.length
			if rows.length == 0
				blk.call(@url)
			end
			items = @doc.at_css("div.f14red").text
			rows.collect do |row|
				#puts row
				['tr[1]/td[2]',
				 'tr[2]/td[2]',
				 'tr[3]/td[2]',		 
				 'tr[4]/td[2]',
				 'tr[5]/td[2]',
				 'tr[6]/td[2]',
				].each do |xpath|
					#puts "#{row.at_xpath(xpath).to_s.strip_tag.strip}"
					items += "\t" + row.at_xpath(xpath).to_s.strip_tag.strip 
				end
				items += "\t" + @url
			  #puts detail
				if block_given?	
					blk.call(items)
				else
					puts detail
				end
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
				@url_lists = %w(http://www.unifly.com.cn/product/157.aspx
http://www.unifly.com.cn/product/156.aspx
http://www.unifly.com.cn/product/155.aspx
http://www.unifly.com.cn/product/154.aspx
http://www.unifly.com.cn/product/153.aspx
http://www.unifly.com.cn/product/152.aspx
http://www.unifly.com.cn/product/151.aspx
http://www.unifly.com.cn/product/150.aspx
http://www.unifly.com.cn/product/149.aspx
http://www.unifly.com.cn/product/148.aspx
http://www.unifly.com.cn/product/147.aspx
http://www.unifly.com.cn/product/146.aspx
http://www.unifly.com.cn/product/145.aspx
http://www.unifly.com.cn/product/144.aspx
http://www.unifly.com.cn/product/143.aspx
http://www.unifly.com.cn/product/142.aspx
http://www.unifly.com.cn/product/141.aspx
http://www.unifly.com.cn/product/140.aspx
http://www.unifly.com.cn/product/139.aspx
http://www.unifly.com.cn/product/138.aspx
http://www.unifly.com.cn/product/137.aspx
http://www.unifly.com.cn/product/136.aspx
http://www.unifly.com.cn/product/135.aspx
http://www.unifly.com.cn/product/134.aspx
http://www.unifly.com.cn/product/133.aspx
http://www.unifly.com.cn/product/132.aspx
http://www.unifly.com.cn/product/131.aspx
http://www.unifly.com.cn/product/130.aspx
http://www.unifly.com.cn/product/129.aspx
http://www.unifly.com.cn/product/128.aspx
http://www.unifly.com.cn/product/127.aspx
http://www.unifly.com.cn/product/126.aspx
http://www.unifly.com.cn/product/125.aspx
http://www.unifly.com.cn/product/124.aspx
http://www.unifly.com.cn/product/123.aspx
http://www.unifly.com.cn/product/122.aspx
http://www.unifly.com.cn/product/121.aspx
http://www.unifly.com.cn/product/120.aspx
http://www.unifly.com.cn/product/119.aspx
http://www.unifly.com.cn/product/118.aspx
http://www.unifly.com.cn/product/117.aspx
http://www.unifly.com.cn/product/116.aspx
http://www.unifly.com.cn/product/115.aspx
http://www.unifly.com.cn/product/114.aspx
http://www.unifly.com.cn/product/113.aspx
http://www.unifly.com.cn/product/112.aspx
http://www.unifly.com.cn/product/111.aspx
http://www.unifly.com.cn/product/110.aspx
http://www.unifly.com.cn/product/109.aspx
http://www.unifly.com.cn/product/108.aspx
http://www.unifly.com.cn/product/107.aspx
http://www.unifly.com.cn/product/106.aspx
http://www.unifly.com.cn/product/105.aspx
http://www.unifly.com.cn/product/104.aspx
http://www.unifly.com.cn/product/103.aspx
http://www.unifly.com.cn/product/102.aspx
http://www.unifly.com.cn/product/101.aspx
http://www.unifly.com.cn/product/100.aspx
http://www.unifly.com.cn/product/99.aspx
http://www.unifly.com.cn/product/98.aspx
http://www.unifly.com.cn/product/97.aspx
http://www.unifly.com.cn/product/96.aspx
http://www.unifly.com.cn/product/95.aspx
http://www.unifly.com.cn/product/94.aspx
http://www.unifly.com.cn/product/93.aspx
http://www.unifly.com.cn/product/92.aspx
http://www.unifly.com.cn/product/91.aspx
http://www.unifly.com.cn/product/90.aspx
http://www.unifly.com.cn/product/89.aspx
http://www.unifly.com.cn/product/88.aspx
http://www.unifly.com.cn/product/87.aspx
http://www.unifly.com.cn/product/86.aspx
http://www.unifly.com.cn/product/85.aspx
http://www.unifly.com.cn/product/84.aspx
http://www.unifly.com.cn/product/83.aspx
http://www.unifly.com.cn/product/82.aspx
http://www.unifly.com.cn/product/81.aspx
http://www.unifly.com.cn/product/80.aspx
http://www.unifly.com.cn/product/79.aspx
http://www.unifly.com.cn/product/78.aspx
http://www.unifly.com.cn/product/77.aspx)
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
				@url_lists.each_with_index do |url, i|
					puts "#{i} -- #{url}"
					ContentWorker.new(url).build_content do |cc|
						@file_to_write.puts "#{cc}"
						#@file_to_write.puts '*' * 40
					end # build_content
					
						

                end #times
            end #output_content

    end #Runner

end #SanLv

include SanLv

id = 1111

Runner.go id
 