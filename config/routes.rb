Rails.application.routes.draw do
  root 'home#index'

  resources :bills

  devise_for :users
end
