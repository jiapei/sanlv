class Brand
  include Mongoid::Document
  include Mongoid::Timestamps
  #名称，logo，国家，品牌说明，logo说明
  field :name, type: String
  field :name_pinyin, type: String
  field :country, type: String
  field :brand_summary, type: String
  field :logo_summary, type: String
  mount_uploader :logo_image, PhotoUploader
  index({name: 1})
	
  index({name_pinyin: 1})
	
  #embeds_many :parameters
  #scope :search_name, lambda { |name| where(:name => /#{name}/) }
  has_many :makers, :dependent => :destroy
  before_save :update_name_pinyin
	
protected
	
  def update_name_pinyin
	
    self.name_pinyin = Pinyin.t(self.name, '').downcase.to_s 
	
  end
	
end

=begin
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
  
  scope :bitautocar, where(tip: "bitautocar")
  end
 =end