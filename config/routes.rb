Rails.application.routes.draw do
  devise_for :models
  get 'categories/index'
  get 'home/index'
  # Root route
  root 'home#index'

  # User registration routes
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  # Session management routes
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Resourceful route for articles
  resources :articles

  # Other custom routes can go here
  # ...
end
