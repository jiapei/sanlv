class Maker
  include Mongoid::Document
  
  field :name, :type => String
  field :pic, :type => String
  field :url, :type => String
  field :code, :type => String
  field :serials, :type => Array

  embedded_in :brand
  #embeds_many :car_serials
  end