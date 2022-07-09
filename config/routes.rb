Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'listings#home'
  get '/user' => 'listings#index', :as => :user_root
  resources :purchases, only: %i[new create]
end