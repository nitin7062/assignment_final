Rails.application.routes.draw do
  # get 'invitations/create'
  # delete 'invitations/destory'
  # get 'invitations/update'
  # get 'invitations/index'
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
  # get "pending", to: "invitations#pending"
  # delete "reject", to: "invitations#destroy"
  root to: 'public#main'
  get 'public/main'
  # get '/help', to: 'public#help'
  # get '/about', to: 'public#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
