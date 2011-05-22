class Development
  include Mongoid::Document
  field :name, type: String
  field :borough, type: String
  embeds_one :address
  accepts_nested_attributes_for :address
end
