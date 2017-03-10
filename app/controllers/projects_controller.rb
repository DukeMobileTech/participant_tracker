class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def show
    project = current_user.projects.find(params[:id])
    set_current_project(project)
    redirect_to project_participants_path(project)
  end
end
