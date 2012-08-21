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
			html_stream.encode!(to_encode, from_encode)
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
		
			rows = @doc.xpath('//div[@class = "r2"]/table')
			puts rows.length
			if rows.length == 0
				blk.call(@url)
			end
			items = @doc.at_css("div.ht3 > span").text
			rows.collect do |row|
				#puts row
				['tr[1]/td[2]',
				 'tr[2]/td[2]',
				 'tr[3]/td[2]',		 
				 'tr[4]/td[2]',
				 'tr[5]/td[2]',
				 'tr[6]/td[2]',
				 'tr[7]/td[2]',
				 'tr[8]/td[2]',
				 'tr[9]/td[2]',
				 'tr[10]/td[2]',
				 'tr[11]/td[2]',
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
				@url_lists = %w(http://www.ybm.com.cn/products_show.asp?id=145&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=246&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=630&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=605&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=562&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=5&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=52&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=60&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=59&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=58&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=57&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=56&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=55&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=53&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=51&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=61&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=70&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=50&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=54&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=62&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=63&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=64&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=65&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=66&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=67&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=49&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=69&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=71&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=72&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=73&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=74&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=68&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=34&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=21&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=22&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=23&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=24&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=25&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=26&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=27&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=28&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=29&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=30&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=31&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=44&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=33&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=48&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=35&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=37&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=38&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=39&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=40&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=41&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=42&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=81&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=43&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=75&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=45&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=46&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=47&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=32&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=112&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=113&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=114&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=115&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=116&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=117&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=118&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=119&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=120&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=121&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=79&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=108&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=132&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=133&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=135&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=137&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=138&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=247&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=606&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=563&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=94&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=77&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=78&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=80&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=134&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=82&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=83&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=84&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=85&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=86&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=88&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=89&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=90&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=91&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=111&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=101&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=76&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=107&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=106&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=105&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=104&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=92&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=102&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=93&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=100&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=99&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=98&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=97&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=96&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=109&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=103&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=14&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=20&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=19&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=18&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=17&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=16&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=7&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=15&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=6&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=13&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=12&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=11&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=8&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=9&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=10&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=136&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=139&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=607&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=248&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=564&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=610&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=249&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=140&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=565&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=141&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=611&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=250&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=251&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=567&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=612&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=568&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=143&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=252&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=613&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=144&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=615&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=569&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=253&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=146&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=570&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=254&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=620&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=571&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=147&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=255&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=621&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=148&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=256&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=572&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=573&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=150&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=257&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=623&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=574&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=152&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=258&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=626&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=575&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=259&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=627&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=153&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=576&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=628&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=154&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=260&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=577&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=155&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=629&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=261&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=262&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=633&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=156&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=578&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=263&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=157&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=579&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=638&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=158&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=650&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=580&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=264&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=581&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=652&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=159&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=265&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=582&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=160&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=653&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=266&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=161&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=583&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=267&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=654&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=655&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=268&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=162&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=584&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=163&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=269&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=585&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=656&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=270&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=586&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=660&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=164&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=271&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=165&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=587&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=661&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=671&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=166&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=272&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=588&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=273&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=589&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=167&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=672&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=274&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=673&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=590&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=168&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=674&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=275&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=169&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=591&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=276&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=592&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=170&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=676&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=171&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=593&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=680&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=594&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=681&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=172&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=683&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=595&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=173&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=596&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=174&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=684&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=597&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=175&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=685&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=689&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=177&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=598&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=691&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=178&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=599&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=600&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=703&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=179&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=704&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=182&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=601&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=183&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=602&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=705&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=185&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=706&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=603&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=186&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=707&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=604&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=608&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=708&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=187&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=188&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=709&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=609&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=614&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=189&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=727&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=728&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=616&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=190&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=617&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=191&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=729&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=730&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=618&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=193&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=731&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=619&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=732&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=199&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=624&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=733&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=625&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=201&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=734&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=631&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=202&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=746&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=632&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=203&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=204&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=634&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=747&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=748&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=635&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=205&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=766&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=206&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=636&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=767&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=637&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=207&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=208&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=639&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=768&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=209&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=640&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=769&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=770&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=210&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=641&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=771&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=642&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=211&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=772&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=643&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=212&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=213&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=644&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=773&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=774&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=214&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=645&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=775&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=646&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=215&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=647&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=216&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=776&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=648&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=779&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=217&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=649&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=218&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=780&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=219&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=783&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=651&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=220&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=657&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=784&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=221&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=659&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=786&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=662&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=790&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=222&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=223&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=663&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=799&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=800&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=224&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=664&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=801&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=225&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=665&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=802&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=666&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=226&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=803&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=667&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=227&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=668&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=228&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=804&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=669&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=229&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=806&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=807&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=670&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=230&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=231&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=675&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=812&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=232&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=813&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=677&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=233&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=678&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=824&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=834&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=234&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=679&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=682&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=235&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=836&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=236&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=686&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=837&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=687&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=237&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=838&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=688&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=839&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=238&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=840&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=690&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=239&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=841&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=692&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=240&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=241&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=693&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=843&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=844&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=694&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=242&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=845&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=243&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=695&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=244&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=846&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=696&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=245&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=697&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=848&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=698&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=277&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=849&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=335&kind_next=17
http://www.ybm.com.cn/products_show.asp?id=699&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=850&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=279&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=280&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=700&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=861&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=862&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=281&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=701&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=702&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=282&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=863&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=864&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=710&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=283&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=871&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=284&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=711&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=712&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=285&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=872&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=713&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=874&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=286&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=875&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=714&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=287&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=877&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=715&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=288&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=716&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=878&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=289&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=290&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=879&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=717&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=291&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=881&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=718&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=883&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=719&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=292&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=720&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=293&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=891&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=721&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=294&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=894&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=722&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=295&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=895&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=296&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=896&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=723&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=898&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=724&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=297&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=725&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=899&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=298&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=903&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=299&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=726&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=300&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=735&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=904&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=736&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=922&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=301&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=923&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=302&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=737&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=304&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=738&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=924&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=739&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=305&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=925&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=306&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=740&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=926&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=741&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=307&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=927&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=928&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=742&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=308&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=929&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=309&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=743&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=744&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=930&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=310&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=931&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=745&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=311&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=312&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=932&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=749&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=313&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=750&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=936&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=751&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=314&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=937&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=752&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=939&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=315&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=316&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=753&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=940&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=754&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=317&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=941&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=755&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=318&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=956&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=756&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=319&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=957&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=757&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=320&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=958&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=321&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=959&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=758&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=759&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=960&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=322&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=961&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=323&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=760&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=324&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=962&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=761&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=325&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=963&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=762&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=965&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=326&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=763&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=966&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=764&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=327&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=765&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=977&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=328&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=777&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=978&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=329&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=330&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=778&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=979&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=331&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=781&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=980&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=981&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=782&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=332&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=785&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=982&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=333&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=334&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=787&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=983&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=788&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=984&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=336&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=985&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=789&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=337&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=338&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=986&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=791&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=339&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=792&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=987&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=793&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=992&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=340&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=341&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=993&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=794&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=795&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=342&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1013&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=343&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1014&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=796&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=344&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=797&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1015&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=345&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=798&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1016&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=346&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=805&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1017&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=808&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=347&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1018&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=348&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1033&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=809&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1034&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=810&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=349&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1035&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=350&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=811&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1036&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=814&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=351&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=352&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1037&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=815&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=353&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1038&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=816&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=817&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1042&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=354&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1043&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=818&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1051&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=356&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=819&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=357&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1052&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=820&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1055&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=358&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=821&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=822&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=359&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1075&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=823&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=360&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1076&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=825&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=362&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1077&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=363&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=826&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1078&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=364&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=827&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1087&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=828&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=365&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1133&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=366&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1144&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=829&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=367&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1145&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=830&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=368&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1146&kind_next=20
http://www.ybm.com.cn/products_show.asp?id=831&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=369&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=832&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=833&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=370&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=371&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=835&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=372&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=842&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=373&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=847&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=851&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=374&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=375&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=852&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=853&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=376&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=377&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=854&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=378&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=855&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=856&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=379&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=380&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=857&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=858&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=381&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=382&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=859&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=860&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=383&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=865&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=384&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=385&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=866&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=386&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=867&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=387&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=868&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=388&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=869&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=389&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=870&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=873&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=390&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=880&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=391&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=392&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=882&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=884&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=393&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=885&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=394&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=886&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=395&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=887&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=396&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=397&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=888&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=398&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=889&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=890&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=399&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=400&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=892&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=401&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=893&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=402&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=897&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=403&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=900&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=404&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=902&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=405&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=905&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=406&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=906&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=907&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=407&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=408&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=908&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=909&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=409&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=410&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=910&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=411&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=911&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=412&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=912&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=413&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=913&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=914&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=414&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=915&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=415&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=916&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=416&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=917&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=417&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=418&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=918&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=919&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=419&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=920&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=420&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=921&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=421&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=933&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=422&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=423&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=934&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=935&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=424&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=425&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=938&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=426&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=942&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=943&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=427&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=944&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=428&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=945&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=429&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=946&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=430&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=947&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=431&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=948&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=432&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=949&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=433&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=434&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=950&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=951&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=435&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=952&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=436&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=953&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=437&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=954&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=438&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=955&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=439&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=967&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=440&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=968&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=441&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=969&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=442&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=970&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=443&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=971&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=444&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=972&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=973&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=974&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=975&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=448&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=976&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=449&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=988&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=450&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=989&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=451&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=990&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=452&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=991&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=453&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=994&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=454&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=995&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=455&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=996&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=456&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=997&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=457&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=998&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=458&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=999&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=459&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1000&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=460&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1001&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=461&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1002&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=462&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1003&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=463&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=464&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1004&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=465&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1005&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1006&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=466&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1007&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=467&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1008&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=468&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1009&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=469&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1010&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=470&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1011&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1012&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=472&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1019&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=473&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=474&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1020&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=475&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1021&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=476&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1022&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1023&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=477&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1024&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=478&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1025&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=479&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=480&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1026&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=481&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1027&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1028&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=482&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1029&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1030&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=484&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=485&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1031&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=486&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1032&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1039&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=487&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1040&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=488&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=489&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1041&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=490&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1044&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=491&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1045&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1047&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=492&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1048&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=493&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1049&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=494&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=495&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1050&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1053&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=496&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1054&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=497&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=498&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1056&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1057&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=499&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=500&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1058&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=501&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1059&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=502&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1060&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1061&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=503&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1062&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=504&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1063&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=505&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1064&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=506&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=507&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1065&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=508&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1066&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=509&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1067&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=510&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1068&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=511&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1069&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=512&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1070&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=514&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1071&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=515&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1072&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=516&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1073&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=517&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1074&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1079&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=518&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1080&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=519&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1081&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=520&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1082&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=521&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=522&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1083&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1084&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=523&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1085&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=524&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1086&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=525&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=526&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1088&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=527&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1089&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1090&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=528&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=529&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1091&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=530&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1092&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1093&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=531&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=532&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1094&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1095&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=533&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1096&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=534&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=535&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1097&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=536&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1098&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=537&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1099&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1100&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=538&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=539&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1101&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1102&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=540&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1103&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=541&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=542&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1104&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=543&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1105&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1106&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=544&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1107&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=545&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=546&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1108&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1109&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=547&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=548&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1110&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1111&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=549&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1112&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=550&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=551&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1113&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=552&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1114&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1115&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=553&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1116&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=554&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=555&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1117&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=556&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1118&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=557&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1119&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=558&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1120&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1121&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=559&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1122&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=560&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1123&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=561&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1392&kind_next=18
http://www.ybm.com.cn/products_show.asp?id=1124&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1125&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1126&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1127&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1128&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1129&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1130&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1131&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1132&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1134&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1135&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1136&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1137&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1138&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1139&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1140&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1141&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1142&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1143&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1387&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1388&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1389&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1390&kind_next=19
http://www.ybm.com.cn/products_show.asp?id=1391&kind_next=19)
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
 