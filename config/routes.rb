Rails.application.routes.draw do
  devise_for :users
  root 'pets#home'
  resources :pets
end
