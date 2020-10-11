Rails.application.routes.draw do
  
  get 'relationships/create'
  get 'relationships/destroy'
  get 'microposts/create'
  get 'microposts/destroy'
  root to: "toppages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "signup", to: "users#new"
  resources :users, only:[:show, :create, :edit,:update] do
    member do
      get :followings
      get :followers
    end
  end
   
  resources :microposts, only: [:new, :create, :destroy, :show] do
   resources :comments, only: [:create]
  end 

  resources :relationships, only:[:create, :destroy] 
   
end
