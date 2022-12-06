Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users
  resources :invitations
  resources :conversations do
    resources :messages
  end
  # get '/user', to: 'users#index'
  patch "accept",to: "invitations#accept"
  root 'public#main'
  get 'public/main'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
