Rails.application.routes.draw do

  get 'students/index'

  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions',
    passwords: 'students/passwords'
  }

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions',
    passwords: 'companies/passwords'
  }
  
  root to: 'static_pages#home'
  resources :requests
  
  get '/companies', to: 'companies#index'
  get '/students', to: 'students#index'
  
  
end
