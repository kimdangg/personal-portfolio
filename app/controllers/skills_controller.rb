class SkillsController < ApplicationController
  def index
    @skills = Skills.all
  end
end
