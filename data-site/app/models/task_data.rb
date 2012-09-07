class TaskData
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :value, :type => String
  field :url, :type => String
  field :code, :type => String


  belongs_to :task
  end