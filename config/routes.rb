Rails.application.routes.draw do
  resources :deposits
  resources :withdraws
  resources :accounts
  resources :banks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
