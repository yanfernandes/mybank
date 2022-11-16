Rails.application.routes.draw do
  resources :transfers
  resources :deposits
  resources :withdraws
  resources :accounts
  resources :banks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#process_login"
  get "/logout", to: "sessions#logout"
end
