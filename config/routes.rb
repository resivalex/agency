Rails.application.routes.draw do
  root to: 'application#root'

  resources :resumes do
    member do
      get :fully_vacancies
      get :partly_vacancies
    end
  end

  resources :vacancies do
    member do
      get :fully_resumes
      get :partly_resumes
    end
  end
  resources :skills
  get '/angular/:template' => 'angular#template'
end
