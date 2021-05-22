Rails.application.routes.draw do
  get 'cars/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings, only: [:new, :create]
    resources :car_reviews, only: [:new, :create]
  end


  get "users/:user_id", to: 'users#index'
  get "users/:user_id/renter_reviews", to: 'renter_reviews#index'

  post "favorites", to: 'favorites#create', as: :favorites
  delete "favorites/:car_id", to: 'favorites#destroy', as: :favorite
end
