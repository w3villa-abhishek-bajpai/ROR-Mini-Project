# Rails.application.routes.draw do
#   get "up" => "rails/health#show", as: :rails_health_check
#   root 'welcome#index'

#   devise_for :admin_users, controllers: {
#       passwords: 'admin/password'
#     }

#     authenticated :admin_user do
#       root to: "welcome#index", as: :authenticated_root
#     end
  
#     unauthenticated :admin_user do
#       root to: "devise/sessions#new", as: :unauthenticated_root
#     end

#     resources :projects do
#       resources :contributions, only: [:new, :create] do
#         get :verify_payment, on: :collection
#         end
#         member do
#           get :razorpay_payment
#           post :create_razorpay_order
#           post :verify_payment
#         end
#       end
#   # OTP verification routes (manual, outside Devise)
#   get  'admin/verify_otp', to: 'admin/otp_verification#new',    as: :new_admin_otp_verification
#   post 'admin/verify_otp', to: 'admin/otp_verification#create', as: :admin_otp_verification

#   get 'contributions/new'
#   get 'contributions/create'
#   # devise_for :admin_users
#   # resources :projects
#   # resources :courses
#   # resources :students

#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
 
#     resources :projects
#     resources :courses
#     resources :students
#   end
#   resources :blogs

#   namespace :admin do
#     resources :students
#     resources :projects
#     resources :courses
#     resources :blogs
#   end


Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root 'welcome#index'

  devise_for :admin_users, controllers: {
    passwords: 'admin/password'
  }

  authenticated :admin_user do
    root to: "welcome#index", as: :authenticated_root
  end

  unauthenticated :admin_user do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  resources :projects do
    resources :contributions, only: [:new, :create] do
      get :verify_payment, on: :collection
    end

    member do
      get :razorpay_payment
      post :create_razorpay_order
      get :verify_payment
    end
  end

  # OTP verification routes (manual, outside Devise)
  get  'admin/verify_otp', to: 'admin/otp_verification#new',    as: :new_admin_otp_verification
  post 'admin/verify_otp', to: 'admin/otp_verification#create', as: :admin_otp_verification

  resources :courses
  resources :students
  resources :blogs

  namespace :admin do
    resources :students
    resources :projects
    resources :courses
    resources :blogs
  end
end

