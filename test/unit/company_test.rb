require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  test "validation of project_team_roles" do
    c = Company.new :name => "blah"
    assert !c.valid?
    assert_match /can't be blank/, c.errors[:project_team_roles].first

    c.project_team_roles = ["hello"]
    assert !c.valid?
    assert_match /must be some of/, c.errors[:project_team_roles].first

    c.project_team_roles = ["developers"]
    assert c.valid?
  end

  test "project_team_roles should be invalid if role is used" do
    c = Company.create! :name => "blah", :project_team_roles => ["developers"]
    d = Fabricate(:development, :developers => [c])
    c.project_team_roles = ["planning_consultants"]
    assert !c.valid?
    assert_match /development #{d._id} has this company as developers/, c.errors[:base].first
  end

end
