class ProjectsController < ApplicationController
  before_action :authenticate_user!

   def update
    @project.update!(project_params)
    redirect_to dashboard_path, notice: "Project successfully created"
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end
  

  def project_params
    params.require(:project).permit(:title, :description)
  end
end