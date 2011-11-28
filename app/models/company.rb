class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String, :required => true
  field :project_team_roles, :type => Array, :default => [], :required => true
  validate :project_team_roles_valid
  validate :project_team_role_unused

  def project_team_roles_valid
    if (self.project_team_roles - Development::PROJECT_TEAM_ROLES).any?
      errors.add :project_team_roles, "must be some of [#{Development::PROJECT_TEAM_ROLES.join(',')}]"
    end
  end

  def project_team_role_unused
    if self.project_team_roles_changed? && !self.changes['project_team_roles'][0].blank?
      if (removed = self.changes['project_team_roles'][0] - self.changes['project_team_roles'][1]).any?
        removed.each do |ptr|
          if (d = Development.where(Development.reflect_on_association(ptr).foreign_key => self._id).first)
            errors.add :base, "development #{d._id} has this company as #{ptr}"
          end
        end
      end
    end
  end

end
