class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.blank?
        scope.publicly_visable
      else
        scope.publicly_visable.or(user.projects)
      end
    end
  end

  def show?
    record.public? || user_is_owner?
  end

  def create?
    true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
