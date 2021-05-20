Rails.application.routes.draw do
  # resources :cars, only: [:index, :show]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "cars", to: "cars#index"
  get "cars/:id", to: "cars#show"
  get 'favorite', to: 'pages#favorite'
end
