class Link
  include Mongoid::Document
  field :url, :type => String
  field :note, :type => String
  embedded_in :development
end
