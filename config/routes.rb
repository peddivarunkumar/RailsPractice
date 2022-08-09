Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"
  resources :articles do
    resources :comments
  end

  resources :users

  get "sign_up", to: "registrations#new"
  post "sign_up", to:  "registrations#create"

  delete "logout", to: "sessions#destroy"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  
end
