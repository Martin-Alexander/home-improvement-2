module Api
  class CommentsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

    def index
      project = Project.find(params[:project_id])

      raise ActiveRecord::RecordNotFound unless policy(project).show?

      @comments = policy_scope(project.comments).includes(:user)
    end
  end
end