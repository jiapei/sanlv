#encoding=utf-8

require 'open-uri'

  # 根据URL获取内容页HTML
  def get_content_page_html(url)
    html = ""
    begin
      html_stream = open(url)
      html = html_stream.read
      html.encode!("utf-8", "gbk")
    rescue
      puts "can't get url: #{url}"
      html = nil
    end
    return html
  end


 url = 'http://search.51job.com/list/co,c,179972,0000,10,1.html'
 html = get_content_page_html(url)
 puts html