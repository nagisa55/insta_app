Rails.application.routes.draw do
  root to: "toppages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "lgout", to: "sessions#destroy"

  get "signup", to: "users#new"
  post "/users", to: "users#create"
end
