Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :makers, only: [:new, :create]
  resources :games, only: [:new, :create]
  resources :reviews, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :comments, only: [:new, :create]
end