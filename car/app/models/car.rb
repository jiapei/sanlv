class Car
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :baseinfo, type: Hash
end
