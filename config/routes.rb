Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :edit

  authenticate :user do
    resources :cars do
      collection do
        get :modal
      end
    end
  end

  root "home#index"
end
