Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  resources :users



  # root to: 'users#index'
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"

end
