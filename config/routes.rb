Rails.application.routes.draw do
  get 'invitations/create'
  get 'invitations/destory'
  get 'invitations/update'
  get 'invitations/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users
  # resources :invitations
  # get '/user', to: 'users#index'
  patch "accept",to: "invitations#accept"
  root to: 'public#main'
  # get '/help', to: 'public#help'
  # get '/about', to: 'public#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
