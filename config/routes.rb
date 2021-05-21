Rails.application.routes.draw do
  get 'cars/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show, :new, :create]
  get "favorites/:user_id", to: "favorites#index"
  delete "favorites/:id", to: "favorites#destroy"
end
