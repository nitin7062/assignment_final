Rails.application.routes.draw do
  devise_for :users
  # resources :users
  # get '/user', to: 'users#index'
  root to: 'users#index'
  get '/help', to: 'public#help'
  get '/about', to: 'public#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
