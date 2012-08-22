#encoding: UTF-8
require 'rubygems'
require 'mongoid'
require 'pp'

Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end


ENV['MONGOID_ENV'] = 'localcar'
#ENV['MONGOID_ENV'] = 'development'

Mongoid.load!("config/mongoid.yml")
i = 0
serials = []

Brand.each do |b|
	b.makers.each do |m|
		m.serials.each do |s|
			item = {}
			i += 1
			href  = s["href"]
			item = { i: i, brand: b.name, brand_pinyin: b.name_pingyin, maker: m.name, serial: s["name"], url: href}
			serials << item
			
		end
	end
end

puts serials.length

serials.each do |s|

end

#Pinyin.t('中国')  => "zhong guo"
#Pinyin.t('中国', '-') => "zhong-guo"
#Pinyin.t('中国', '') => "zhongguo"
#Pinyin.t('你好world') => "ni hao world"
