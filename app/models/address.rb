class Address
  include Mongoid::Document
  field :postcode_out, :type => String
  field :postcode_in, :type => String
  field :rest, :type => String
  embedded_in :development
end
