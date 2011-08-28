class Development
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String, :required => true
  field :borough, :type => String, :required => true
  field :ward, :type => String, :required => true
  field :location, :type => String
  embeds_one :address
  accepts_nested_attributes_for :address
  STATUSES = %w( pre-planning planning approved demolition site-prep construction complete )
  field :status, :type => String
  validates_inclusion_of :status, :in => STATUSES
  belongs_to :opportunity_area
end
