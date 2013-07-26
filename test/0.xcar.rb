#encoding: UTF-8
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'logger'
require 'pp'


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
class String 
		#替换<br> 为 文本的 换行 
    def br_to_new_line  
        self.gsub('<br>', "\n")  
    end  
    
    def add_url_head(pre_str)
      self.gsub('src="/', "src=\"#{pre_str}/")
    end
    def p_to_new_line  
        self.gsub('</p>', "\n")  
    end  
		#去掉所有的html标签，但是保留 文字
    def strip_tag  
        self.gsub(%r[<[^>]*>], '')  
    end  
		#去掉所有 html标签，不保留文字 
		def strip_all_tag
			self.gsub(%r[<.*>], '')
		end
		#去掉 某些 后 然后再去掉 。。。
		def strip_51job_tag
			self.gsub(%r[<br.*], '').gsub(%r[<[^>]*>], '')
		end
end #String 

def safe_open(url, retries = 5, sleep_time = 0.42,  headers = {})
  begin  
      html = open(url).read  
	rescue StandardError,Timeout::Error, SystemCallError, Errno::ECONNREFUSED #有些异常不是标准异常  
      puts $!  
      retries -= 1  
      if retries > 0  
        sleep sleep_time and retry  
      else  
        logger.error($!)
        #错误日志
        #TODO Logging..  
      end  
  end
end

class Spider
  def initialize(first_page)
    @url = first_page
  end
  
  def do_get_list
    #获取列表页
    get_details_url_list(@url)
    
    #获取详细页
    #do_get_detail
    
  end


private  

  
  def get_details_url_list(next_list_page)
    loop do 
      fetch_list(next_list_page)
      puts @doc.at_xpath('//title').to_s
      #break
      #pp @doc
      @doc.xpath('//div[@class="fn_0209"]//a').each do |item|
        puts item.to_s      
        
      end
      break
    end
  end  
  
  def fetch_list(url)
    @doc = nil
    html_stream = safe_open(url , retries = 3, sleep_time = 0.2, headers = {})
    html_stream.encode!('utf-8', 'gbk', :invalid => :replace)
    @doc = Nokogiri::HTML(html_stream)
  end
 
  
end


firstpage = 'http://www.xcar.com.cn/bbs/forumdisplay.php?fid=741&page=29'

Spider.new(firstpage).do_get_list
