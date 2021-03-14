class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = policy_scope(Project).includes(:user)
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    authorize @project

    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  # def update

  # end

  def destroy
    project = Project.find(params[:id])
    authorize project

    project.destroy

    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :status, :estimated_level_of_effort, :actual_level_of_effort)
  end
end
