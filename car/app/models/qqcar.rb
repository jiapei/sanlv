class Qqcar
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :url, type: String
  
  field :title, type: String
  field :price, type: String
  field :price2, type: String
  field :brand, type: String
  field :series, type: String
  field :production, type: String

  
  has_one :cache_html, class_name: "QqCacheHtml"
  embeds_many  :parameters
end


class QqCacheHtml
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :url,  :type => String
  field :value, :type => String

  belongs_to :qqcar
end

