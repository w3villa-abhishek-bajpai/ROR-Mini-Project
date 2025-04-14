Rails.application.routes.draw do
  # devise_for :admin_users
  # resources :projects
  # resources :courses
  # resources :students

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'welcome#index'
  
  Rails.application.routes.draw do
    devise_for :admin_users, controllers: {
      passwords: 'admin/password'
    }
  

    authenticated :admin_user do
      root to: "home#index", as: :authenticated_root
    end
  
    unauthenticated :admin_user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  
 
    resources :projects
    resources :courses
    resources :students
  end
  

  

  # OTP verification routes (manual, outside Devise)
  get  'admin/verify_otp', to: 'admin/otp_verification#new',    as: :new_admin_otp_verification
  post 'admin/verify_otp', to: 'admin/otp_verification#create', as: :admin_otp_verification

  



 
  resources :blogs

  namespace :admin do
    resources :students
    resources :projects
    resources :courses
    resources :blogs
  end


end
