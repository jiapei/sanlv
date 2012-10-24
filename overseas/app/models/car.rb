class Car
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :year
  field :maker, 	:type => String
  field :model, 		:type => String
  field :engine, 		:type => String
  field :vehicle_id
  field :vehicle_code,	:type => String
  
  field :maker_url,		:type => String
  field :model_url,		:type => String
  field :engine_url,		:type => String


end