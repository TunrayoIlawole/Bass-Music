Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "albums#index"
  
  # Albums routes
  resources :albums, only: [:index, :show] do
    resource :favourite, only: [:create, :destroy]
  end

  get 'favourites', to: 'favourites#index', as: 'favourites'
end
