class Parameter
  include Mongoid::Document
  #include Mongoid::Timestamps
  
  field :name, :type => String
  field :value, :type => String


  embedded_in :aap
end