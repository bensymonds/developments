class Development
  include Mongoid::Document
  field :name, type: String
  field :borough, type: String
  field :address, type: String
end
