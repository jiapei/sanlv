class Brand
  include Mongoid::Document
  
  field :name, :type => String
  field :name_pingyin, :type => String
  field :pic, :type => String
  field :pic_url, :type => String
  field :url, :type => String
  field :code, :type => String

  embeds_many :makers
  end