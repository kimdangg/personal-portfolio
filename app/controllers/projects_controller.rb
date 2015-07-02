class ProjectsController < ApplicationController
  def show
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
  end

  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      redirect skill_project_path(@skill, @project)
    else
      render :new
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :link)
  end
end
