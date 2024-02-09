Rails.application.routes.draw do
  # Dashboard route
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  devise_for :users
  devise_for :models

  # Categories route
  get '/categories', to: 'categories#index', as: 'categories'

  # Home route
  get 'home/index'
  root 'home#index'

  # User registration routes
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  # Session management routes
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Health check route
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Resourceful route for articles
  resources :articles

  # Other custom routes can go here
  # ...
end
