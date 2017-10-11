Rails.application.routes.draw do
  root 'ads#index'
  get 'users', to: 'users#index'
  get 'users/:id/edit', to: 'users#edit'
  post 'users/:id/edit', to: 'users#update'
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'
  get 'users/ads/:id', to: 'users#ads', as: :user_ads
  resources :ads
  resources :types
  devise_for :users
end
