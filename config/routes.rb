Rails.application.routes.draw do
  root to:'prototypes#index'
  devise_for :users 
    
  resources :prototypes do
    resources :comments
  end
  resources :users
end
