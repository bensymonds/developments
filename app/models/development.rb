class Development
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :borough, type: String
  embeds_one :address
  accepts_nested_attributes_for :address
end
