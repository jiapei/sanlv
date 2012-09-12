class CarMaker
  include Mongoid::Document
  
  field :brand_name, :type => String
  field :name, :type => String
  field :maker_name, :type => String
  field :country_name, :type => String
  field :pic, :type => String
  field :url, :type => String
  field :code, :type => String
  field :serials, :type => Array

  has_many :car_serials
  end