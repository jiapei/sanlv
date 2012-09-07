class Brand
  include Mongoid::Document
  
  field :name, :type => String
  field :name_pinyin, :type => String
  field :pic, :type => String
  field :pic_url, :type => String
  field :url, :type => String
  field :code, :type => String
  field :tip, :type => String

  embeds_many :makers
  end