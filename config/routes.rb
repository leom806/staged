Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :customers, only: :index

  authenticate :user do
    resources :cars do
      collection do
        get :modal
      end
    end
  end

  root "home#index"
end
