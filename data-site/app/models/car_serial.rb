class CarSerial
  include Mongoid::Document
  
  field :name, :type => String
  field :pic, :type => String
  field :firstyear, :type => String
  field :lastyear, :type => String
  
  field :url, :type => String
  field :code, :type => String

  #embedded_in :maker
  end