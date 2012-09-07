class CarModel
  include Mongoid::Document
  
  field :name, :type => String
  field :year, :type => String
  field :pic, :type => String
  field :url, :type => String


  embedded_in :car_serial
  end