class Reference
  include Mongoid::Document
  belongs_to :development
  validates_presence_of :development_id
  belongs_to :event
  field :source, :type => String, :required => true
  field :source_url, :type => string
  field :timestamp, :type => Datetime # maybe only month,year
  field :title, :type => String, :requred => true
  field :author, :type => String
  field :link, :type => String
end
