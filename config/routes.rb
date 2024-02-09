Rails.application.routes.draw do
  get 'groups/index'
  # Dashboard route
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  devise_for :users

  # Categories route
  get '/groups', to: 'groups#index', as: 'groups'

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

  # Nested routes for categories under groups
  resources :groups do
    resources :categories
  end

  # Other custom routes can go here
  # ...
end
