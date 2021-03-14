class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      public_project_comments = scope.joins(:project).where(projects: { private: false })
      my_project_comments     = scope.joins(:project).where(projects: { user_id: user.id })

      public_project_comments.or(my_project_comments)
    end
  end

  def create?
    record.project.public? || record.project.user == user
  end
end
