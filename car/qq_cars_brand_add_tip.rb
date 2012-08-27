#encoding: UTF-8
require 'rubygems'
require 'mongoid'
require 'chinese_pinyin'

Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end


ENV['MONGOID_ENV'] = 'localcar'
#ENV['MONGOID_ENV'] = 'development'

Mongoid.load!("config/mongoid.yml")

Brand.each do |b|
	b.tip = 'qqcar'
	b.save()

end

#Pinyin.t('�й�')  => "zhong guo"
#Pinyin.t('�й�', '-') => "zhong-guo"
#Pinyin.t('�й�', '') => "zhongguo"
#Pinyin.t('���world') => "ni hao world"
