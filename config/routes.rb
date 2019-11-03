Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :followings
      get :favindex
    end
  end
  
  
  
  resources :favorites_users, only: [:create, :destroy]
  resources :makers, only: [:new, :create]
  resources :games, only: [:new, :create]
  resources :reviews, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :comments, only: [:new, :create]
  end
end