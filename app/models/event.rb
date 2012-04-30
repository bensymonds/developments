class Event
  include Mongoid::Document
  field :year, :type => Integer, :required => true
  field :month, :type => Integer, :required => true
  field :type, :type => Symbol, :required => true
  TYPES = [:ownership, :finance, :planning, :appointments, :consultation, :project_schedule, :background, :reviews, :other]
  validates_inclusion_of :type, :in => TYPES
  field :text, :type => String, :required => true
  has_many :references
  validates_presence_of :reference_ids
end