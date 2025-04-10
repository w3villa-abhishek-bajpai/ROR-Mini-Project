Rails.application.routes.draw do
  devise_for :admin_users
  resources :projects
  resources :courses
  resources :students

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'welcome#index'

 
  resources :blogs

  namespace :admin do
    resources :students
    resources :projects
    resources :courses
    resources :blogs
  end


end
