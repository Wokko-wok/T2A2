Rails.application.routes.draw do
  devise_for :users
  root 'pets#index'
  resources :pets
end
