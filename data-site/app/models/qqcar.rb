class Qqcar
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :name_pinyin, type: String

  field :brand, type: String
  field :series, type: String
  field :maker, type: String
  field :year, type: String
  
  field :url, type: String
  field :tip, type: String
  field :price, type: String
  field :all_price, type: String


  
  has_one :cache_html, class_name: "QqCacheHtml"
  embeds_many  :parameters
  
  scope :bitautocar, where(tip: "bitautocar").asc(:created_at)
  scope :bitautocar2, where(tip: "bitautocar")
end


class QqCacheHtml
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :url,  :type => String
  field :value, :type => String

  belongs_to :qqcar
end

