Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/thanks', to: 'pages#thanks'
  get '/dashboard', to: 'pages#dashboard'

  resources :users, only: [:new, :create, :show, :index, :destroy] do
    member do
      get :profile
    end
  end

  resources :blogs

  devise_scope :user do
    delete '/users/sign_out', to: 'devise/sessions#destroy'
  end

end
