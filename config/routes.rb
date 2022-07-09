Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'listings#home'
  get '/user' => 'listings#index', :as => :user_root
  
  post "listings/:id/order", to: "listings#placeorder", as: 'place_order'
  get 'pages/succes', to: 'pages#success', as: "order_success"
end