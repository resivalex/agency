class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.all
  end
end
