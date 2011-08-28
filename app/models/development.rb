class Development
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :borough, :type => String
  field :ward, :type => String
  field :location, :type => String
  embeds_one :address
  accepts_nested_attributes_for :address
  STATUSES = %w( pre-planning planning approved demolition site-prep construction complete )
  field :status, :type => String
  validates_inclusion_of :status, :in => STATUSES
end
