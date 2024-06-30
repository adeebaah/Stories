Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/thanks', to: 'pages#thanks'
  get '/dashboard', to: 'pages#dashboard'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # devise_for :users

  resources :users, only: [:new, :create, :show, :index, :destroy]
  resources :blogs do
    get '/blogs/:id', action: :index, on: :collection
  end

  resources :blogs


  # devise_for :users
  # resources :users, only: [:show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
