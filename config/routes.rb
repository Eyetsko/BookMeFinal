Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :books, except: [:edit, :update] do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:destroy, :index]
end
