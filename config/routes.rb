Rails.application.routes.draw do
  
  get 'favorites/create'
  get 'favorites/destroy'
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
   
  resources :microposts do
   resources :comments, only: [:create]
   resource :favorites, only: [:create, :destroy]
  end 

  resources :relationships, only:[:create, :destroy] 
   
end
