Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'pets#home'
  resources :pets
  get '/user' => "pets#index", :as => :user_root

end