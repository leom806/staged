Rails.application.routes.draw do
  resources :cars
  resources :companies
  devise_for :users

  authenticate :user do
    resources :services
  end

  root "home#index"
end
