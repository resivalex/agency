class VacanciesController < ApplicationController
  before_action :find_vacancy, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |f|
      f.html { @vacancies = Vacancy.ordered }
      f.json { render json: @vacancies = Vacancy.ordered.page(params[:page] || 1).per(3) }
    end
  end

  def show
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      redirect_to edit_vacancy_path(@vacancy), notice: 'Created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vacancy.update(vacancy_params)
      redirect_to edit_vacancy_path(@vacancy), notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
    if @vacancy.destroy
      redirect_to vacancies_path, notice: 'Deleted'
    else
      redirect_to vacancy_path, alert: 'Can\'t delete'
    end
  end

  private

  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.required(:vacancy).permit(:name,
                                     :salary,
                                     :expires_at,
                                     :phone,
                                     :email,
                                     :extra_contacts,
                                     skill_ids: [])
  end
end
