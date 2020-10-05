Rails.application.routes.draw do
  
  get 'microposts/create'
  get 'microposts/destroy'
  root to: "toppages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "signup", to: "users#new"
  resources :users, only:[:show, :create, :edit]
  resources :microposts, only: [:new, :create, :destroy, :show] do
   resources :comments, only: [:create]
  end 
end
