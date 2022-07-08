Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'pets#home'
  resources :pets
end
