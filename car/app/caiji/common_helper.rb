require 'nokogiri'
require 'open-uri'
require 'timeout'
module CommonHelper
  def safe_open(url, retries = 5, sleep_time = 0.42, headers = {},from_c = "gbk",to_c = "utf-8")
    begin  
      html = open(url, headers).read  
			html.encode!(to_c, from_c)
    rescue StandardError,Timeout::Error, SystemCallError, Errno::ECONNREFUSED #有些异常不是标准异常  
      puts $!  
      retries -= 1  
      if retries > 0  
        sleep sleep_time and retry  
      else  
				#错误日志
        #TODO Logging..  
      end  
			nil
  
    end
  end
end
