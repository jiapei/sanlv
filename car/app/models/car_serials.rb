class CarSerial
  include Mongoid::Document
  
  field :name, :type => String
  field :type, :type => String
  field :pic, :type => String
  field :firstyear, :type => String
  field :lastyear, :type => String
  
  field :url, :type => String
  field :code, :type => String
  
  field :baoyangzhouqi
  field :baoyangjiage
  field :bangyangurl

  belongs_to :car_maker,  :inverse_of => :car_serials
  end