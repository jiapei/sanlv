class HtmlContent
  include Mongoid::Document
  field :url, :type => String
  field :content, :type => String
  field :type, :type => String
  field :status, :type => String
end
