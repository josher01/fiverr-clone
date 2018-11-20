Rails.application.routes.draw do
  get 'home', to: 'pages#index'
  devise_for :users
  root to: "pages#index"

  resources :reviews
  resources :services, only: [:index,:create, :show, :new, :update] do
    collection do
      match 'search'=> 'services#search', via: [:get, :post], :as => 'search'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
