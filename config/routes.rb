Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    resources :cars, only: :index do
      collection do
        get :modal
      end
    end
  end

  root "home#index"
end
