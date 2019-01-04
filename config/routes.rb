Rails.application.routes.draw do
  get 'home', to: 'pages#index'
  devise_for :users
  root to: "pages#index"

  resources :reviews
  resources :categories do
    member do
      get :services
    end
  end
  resources :services


  resources :users, only: [:new, :create, :update], as: "onboarding", path: "seller_onboarding"
  resources :users, only: [:show], as: "profile", path: "profile"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
