class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    authorize @skill = Skill.new
  end

  def create
    authorize @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = "Skill successfully added!"
      redirect_to skills_path
    else
      flash[:alert] = "There was a problem adding your skill. Please try again."
      render :new
    end
  end

  def edit
    authorize @skill = Skill.find(params[:id])
  end

  def update
    authorize @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "Skill successfully updated!"
      redirect_to skill_path(@skill)
    else
      flash[:alert] = "There was a problem updating your skill. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
