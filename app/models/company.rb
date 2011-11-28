class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :project_team_roles, :type => Array, :default => [], :required => true
  validate :project_team_roles_valid

  def project_team_roles_valid
    if (self.project_team_roles - Development::PROJECT_TEAM_ROLES).any?
      errors.add :project_team_roles, "must be some of [#{Development::PROJECT_TEAM_ROLES.join(',')}]"
    end
  end

end
