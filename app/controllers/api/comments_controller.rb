module Api
  class CommentsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

    def index
      project = Project.find(params[:project_id])

      raise ActiveRecord::RecordNotFound unless policy(project).show?

      @comments = policy_scope(project.comments).includes(:user)
    end

    def create
      @project = Project.find(params[:project_id])
      @comment = Comment.new(comment_params)
      @comment.project = @project
      @comment.user = current_user

      if @comment.save
        render :show
      else
        render json: @comment.errors.messages, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end