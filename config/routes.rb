Rails.application.routes.draw do
  root to: 'application#root'

  resources :resumes
  resources :vacancies
end
