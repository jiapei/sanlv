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
    @next_page = 0
    @max_page = 1
    
    
  end
  
  def create_file_to_write(name = 'file')
    file_path = File.join('.', "#{name}-#{Time.now.to_formatted_s(:number) }.txt")
    @file_to_write = IoFactory.init(file_path)
  end #create_file_to_write
  
  def do_get_list
    #获取列表页
    get_details_url_list(@url)
    
    #获取详细页
    #do_get_detail
    
  end
  def do_get_detail
    get_details_content
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
  

  
  def get_details_content
    @article = Article.all.desc(:created_at).where(:status => 'init' , :category => '16888-车居知识')
    
    puts @article.count
    
    @article.each_with_index do |article, i|
      puts "#{i}_#{article.name}"
      puts "#{i}_#{article.url}"
      if article.url == ''
        article.status = "error"
        article.save
        next 
      end
      fetch_detail(article.url)
    
      puts @detail_doc.at_xpath('//title').to_s
      html_string = @detail_doc.at_xpath('//div[@id="content"]/div[@class="bd"]').to_s
      next_page_url = article.url
      loop do 
        jj = 0
        @detail_doc.xpath('//a').each do |link|
          #存在下一页，但是 下一页 ！= 当前页
          if link.at_xpath('text()').to_s == "下一页"
            puts  link
            link_str = link.at_xpath('@href').to_s
            link_str = "http://yongche.16888.com#{link_str}"  if link_str[0] == '/'
            
            break if  next_page_url == link_str

            jj += 1
            puts next_page_url = link_str
            fetch_detail(next_page_url)
            html_string += @detail_doc.at_xpath('//div[@id="content"]/div[@class="bd"]').to_s              
            

          end
        end
        break if jj == 0
      end
      #puts html_string
      #break
      article.content = html_string#.add_url_head("http://www.xjauto.net")
      article.content_txt = html_string.strip_tag
#break     
      article.tags = "" #@detail_doc.xpath('//div[@class="arelated"]/dl/dt/p')[1].to_s.strip_tag
      article.status = "completed"
      article.save
      #break
    end
  end
  
  def fetch_list(url)
    @doc = nil
    html_stream = safe_open(url , retries = 3, sleep_time = 0.2, headers = {})
    #html_stream.encode!('utf-8', 'gbk')
    @doc = Nokogiri::HTML(html_stream)
  end
  def fetch_detail(detail_url)
    @detail_doc = nil
    html_stream = safe_open(detail_url , retries = 3, sleep_time = 0.2, headers = {})
#    begin
#    html_stream.encode!('utf-8', 'gbk')
#    rescue StandardError,Timeout::Error, SystemCallError, Errno::ECONNREFUSED #有些异常不是标准异常  
#     puts $!  
#    end
    @detail_doc = Nokogiri::HTML(html_stream)
  end
  
  def max_list_page_num
    puts @doc.at_css('title')
    @max_page = 90
  end
  
  def next_list_page
    #html_stream = safe_open(@url , retries = 3, sleep_time = 0.2, headers = {})
    #@doc = Nokogiri::HTML(html_stream)
    @next_page += 1

    current_page = "http://yongche.16888.com/cjzs/index_#{@next_page}.html"
    #current_page = "http://auto.jiaodong.net/system/more/4060000/0000/4060000_#{'%08d' % @next_page}.shtml"
  end

end


firstpage = 'http://www.xcar.com.cn/bbs/forumdisplay.php?fid=741&page=29'

Spider.new(firstpage).do_get_list
#Spider.new(firstpage).do_get_detail
