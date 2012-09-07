require 'mongoid'

=begin
 puts File.dirname(__FILE__)
 puts Dir.glob("#{File.dirname(__FILE__)}/*.rb")
 puts Dir.glob("#{File.dirname(__FILE__)}/test_mongoid.rb")
=end

Dir.glob("#{File.dirname(__FILE__)}/app/models/*.rb") do |lib|
  require lib
end


ENV['MONGOID_ENV'] = 'development'

Mongoid.load!("config/mongoid.yml")

# item = HtmlContent.new
# t = {:url => 'url', :content => 'content', :type => 'type', :status => 'status'}
# item.update_attributes(t)

puts Car.all.size
