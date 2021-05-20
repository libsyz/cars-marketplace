Rails.application.routes.draw do
  get 'cars/index'
  devise_for :users
  root to: 'pages#home'
  resources :cars, only: [:index]
  get "favorites/:car_id", to: "favorites#index"

end
