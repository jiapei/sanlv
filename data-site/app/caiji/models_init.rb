require 'mongoid'

Dir.glob("#{File.dirname(__FILE__)}/../models/*.rb") do |lib|
  require lib
end

ENV['MONGOID_ENV'] = 'development'

Mongoid.load!("../../config/mongoid.yml")