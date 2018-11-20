Rails.application.routes.draw do
  get 'home', to: 'pages#index'
  devise_for :users
  root to: "pages#index"

  resources :reviews
  resources :services
  get '/search'=> 'search#index', :as => 'search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
