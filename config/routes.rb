Rails.application.routes.draw do
  root 'home#index'

  resources :bills

  devise_for :users

  resources :users, only: [:show] do
    resources :friends
  end
end
