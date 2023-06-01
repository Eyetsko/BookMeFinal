Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :books do
    resources :rentals, only: [:new, :create, :edit, :update]
  end
  resources :rentals, only: [:index]

  get :profile, to: "pages#profile"
end
