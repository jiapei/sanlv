#encoding: UTF-8
require './helper_51job.rb'
require './common_helper.rb'
require 'pp'
class Caiji51job

	include Helper51job
	include CommonHelper

	def cai
		@totle_item_num = 0
		get_list_page_urls.each do |url| # 获取列表页URL列表进行循环
				get_from_list_url(url) # 采集入口地址 
		end
	end

	def get_from_list_url(url, page_index = 1)
		#当前列表页地址
		current_url = list_url(url, page_index)
		#读取 当前列表页 页面内容=>得到内容页面地址
		list_page_html = get_list_page_html(current_url)
		content_page_url_list = parse_list_page_html(list_page_html)
		#读取 所有内容页
		if content_page_url_list.length > 0

			#输出 内容页 内容
			output_content(content_page_url_list)
			#本页内容正常，读取下一页
			get_from_list_url(url, page_index + 1)
		end
	end

	#输出 内容页 内容
	def output_content(list_urls)
		list_urls.each do |s|
			#读取单页内容输出
			content_page_html = get_content_page_html(s[:url])
			
			if content_page_html != nil
				content_item = parse_content_page_html(content_page_html)
				puts "\n=#{@totle_item_num += 1}" + "~"*35
				pp content_item

			end
				
		end
	end
end

caiji = Caiji51job.new
caiji.cai
