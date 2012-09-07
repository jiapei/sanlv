class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :url, type: String
  field :note, type: String
  field :published, type: Boolean
  
  field :code, type: String
  
  has_many :task_dataes
end


