class Building
  include Mongoid::Document
  belongs_to :development
  field :label, :type => String
  field :name, :type => String
  field :description, :type => String
  field :floors_above_ground, :type => Integer, :required => true
  field :floors_below_ground, :type => Integer, :required => true
  field :heigh_aod, :type => Integer, :if => lambda {heigh_agd.blank?}
  field :heigh_agd, :type => Integer, :if => lambda {heigh_aod.blank?}
end
