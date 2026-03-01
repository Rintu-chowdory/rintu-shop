Rails.application.routes.draw do
  devise_for :users
  resources :products
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check
  root "products#index"
end
