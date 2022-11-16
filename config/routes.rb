Rails.application.routes.draw do
  resources :accounts do
    resources :transfers
    resources :deposits
    resources :withdraws
  end
  resources :banks
  resources :users do
    resources :accounts
  end 
 
  root "home#index"
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#process_login"
  get "/logout", to: "sessions#logout"
end
