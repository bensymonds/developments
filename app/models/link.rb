class Link
  include Mongoid::Document
  field :url, :type => String, :required => true
  field :note, :type => String
  embedded_in :development
end
