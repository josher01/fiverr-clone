Rails.application.routes.draw do
  get 'home', to: 'pages#index'
  devise_for :users
  root to: "pages#index"

  resources :reviews
  resources :category, only: [:show] do
    resources :services, only: [:index]
  end
  resources :services, except: [:index]

  resources :users, only: [:new, :create, :show], path_names: {new: 'onboarding', show: 'profile'}

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
