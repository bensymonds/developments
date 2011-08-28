class Address
  include Mongoid::Document
  field :postcode_out, :type => String, :required => true
  field :postcode_in, :type => String, :required => true
  field :rest, :type => String, :required => true
  embedded_in :development
end
