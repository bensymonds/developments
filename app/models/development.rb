class Development
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String, :required => true
  field :borough, :type => String, :required => true
  field :ward, :type => String, :required => true
  field :location, :type => String
  embeds_one :address
  validates_presence_of :address
  accepts_nested_attributes_for :address
  STATUSES = %w( pre-planning planning approved demolition site-prep construction complete )
  field :status, :type => String
  validates_inclusion_of :status, :in => STATUSES
  belongs_to :opportunity_area
  embeds_many :links
  accepts_nested_attributes_for :links, :reject_if => :all_blank
  PROJECT_TEAM_ROLES = %w(developers planning_consultants architects structural_engineers visualisation_consultants main_contractors)
  PROJECT_TEAM_ROLES.each {|m| has_and_belongs_to_many m, :class_name => "Company"}
  has_many :buildings
end
