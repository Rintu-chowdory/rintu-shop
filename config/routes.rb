Rails.application.routes.draw do
  get "pages/home"
  devise_for :users
  resources :products

  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
