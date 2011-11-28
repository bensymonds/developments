ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  setup :clear_db

  def clear_db
    Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
