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
        self.gsub(%r[<[^>]*>], '').gsub(/\t|\n|\r/, '!')
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
		
			rows = @doc.xpath('//table/tr')
			rows.collect do |row|
			  detail = row.to_s.strip_tag
			  #puts detail
				if block_given?	
					blk.call(detail)
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
				@url_lists = %w(http://www.niparts.com/Control/Index/readtype.ashx?mfaid=340992&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=621056&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=609280&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=257024&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=459776&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=432128&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5643776&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5298688&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5299200&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=595456&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=464384&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=151040&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=465408&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=258048&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=258560&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=637952&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=427008&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5479424&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=305152&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5474304&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5299712&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5328896&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=306176&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5413376&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=260608&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5449728&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5440000&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5300736&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=434176&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=610816&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=611328&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=261632&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5440512&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=421888&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=434688&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5439488&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=436224&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=612352&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=612864&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=613376&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5301248&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5441024&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5646848&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5450240&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5647360&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5320192&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5301760&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5478912&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5396480&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5319168&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=308224&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=262656&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=263168&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=308736&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5326336&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=332288&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=264192&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=264704&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=265216&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=309248&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5321216&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5646336&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=266752&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5302272&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5414912&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5441536&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5442048&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5302784&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=438784&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=310784&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5303296&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5303808&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5513728&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5517312&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5330432&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5320704&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5447168&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5304320&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5304832&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5458432&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=381440&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=268288&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5300224&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=268800&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5307392&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=616448&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=431104&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=416768&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5307904&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5308928&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=416256&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5641728&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5313024&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5270528&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=313344&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5166592&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=442368&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=617472&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=269824&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5457920&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5326848&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5327360&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5477376&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5443072&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5443584&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5308416&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5395456&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5309440&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5309952&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5310464&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=617984&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=428032&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=272896&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5310976&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5518336&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5311488&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5442560&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=621568&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=331264&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5633536&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=631808&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=274432&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=622592&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=275456&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=275968&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5312000&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=276480&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=465920&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5329920&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5319680&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5397504&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=249344&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=331776&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=279040&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=381952&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=279552&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=661504&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5166080&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=595968&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=447488&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5421056&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=589824&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=428544&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5401088&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=592896&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5658112&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=282112&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=479232&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5655552&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=414208&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=113664&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=282624&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=283136&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=320000&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=628736&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=283648&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=630272&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=284160&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5327872&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=429056&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=284672&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=285184&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5444096&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5445120&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5412864&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=285696&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=286208&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=589312&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=287232&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=635392&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=288256&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=330240&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5400576&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=451584&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=415744&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=289280&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=452096&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=417792&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=649216&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5448192&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=635904&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=415232&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=289792&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5480448&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=382976&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=290816&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=291328&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=641024&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=325120&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=616960&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=292864&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5230592&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=293376&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5516800&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5446656&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5644800&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5644288&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5448704&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5328384&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5456896&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=293888&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=294400&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=588288&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=327168&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=327680&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=294912&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=295424&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5394944&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5645824&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=295936&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=328704&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5401600&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5332480&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=296448&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=333312&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=296960&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=457216&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=645632&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=646144&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=298496&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=300032&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=300544&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5474816&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=332800&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=478720&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=648192&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=639488&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5312512&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5472256&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5475840&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5283328&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=648704&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5476352&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=301568&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=588800&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5330944&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5242368&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5331456&type=0&carType=1&Couid=213 
http://www.niparts.com/Control/Index/readtype.ashx?mfaid=5458944&type=0&carType=1&Couid=213 
)
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
                    ContentWorker.new(url).build_lists do |c|
						c.each do |item|
							page_url = "http://www.niparts.com/Control/Index/readtype.ashx?mfaid=#{item[2]}&type=1&Couid=213&code=#{item[3]}"
							@file_to_write.puts "#{item[0]}\t#{item[1]}"
							puts page_url
							ContentWorker.new(page_url).build_content do |cc|
								@file_to_write.puts "\t\t\t#{cc}"
								#@file_to_write.puts '*' * 40
							end # build_content
						end						
						
						
                    end # build_lists
                end #times
            end #output_content

    end #Runner

end #SanLv

include SanLv

id = 1111

Runner.go id
 