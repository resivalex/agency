class ResumesController < ApplicationController
  before_action :find_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.ordered
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to edit_resume_path(@resume), notice: 'Created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to edit_resume_path(@resume), notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
    if @resume.destroy
      redirect_to resumes_path, notice: 'Deleted'
    else
      redirect_to resume_path, alert: 'Can\'t delete'
    end
  end

  private

  def find_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.required(:resume).permit(:first_name,
                                    :last_name,
                                    :middle_name,
                                    :phone,
                                    :email,
                                    :desired_salary,
                                    :is_active,
                                    skill_ids: [])
  end
end
