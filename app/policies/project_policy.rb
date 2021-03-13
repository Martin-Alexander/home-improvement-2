class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.blank?
        scope.publicly_visable
      elsif user.admin
        scope.all
      else
        scope.publicly_visable.or(user.projects)
      end
    end
  end

  def show?
    record.public? || user_is_owner? || user_is_admin?
  end

  def create?
    true
  end

  def update?
    user_is_owner? || user_is_admin?
  end

  def destroy?
    user_is_owner? || user_is_admin?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_admin?
    user.admin
  end
end
