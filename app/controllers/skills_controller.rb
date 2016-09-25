class SkillsController < ApplicationController
  def index
    render json: Skill.all
  end

  def create
    skill = Skill.create(name: params[:name])
    if skill.persisted?
      render json: skill
    else
      render nothing: true, status: :bad_request
    end
  end
end
