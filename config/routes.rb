Rails.application.routes.draw do
  root 'ads#index'
  devise_for :users
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end
  get 'users', to: 'users#index'
  get 'users/:id/edit', to: 'users#edit'
  post 'users/:id/edit', to: 'users#update'
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'
  get 'users/ads/:id', to: 'users#ads', as: :user_ads
  delete 'users/:id', to: 'users#destroy', as: :destroy_user

  post 'ads', to: 'ads#ajax'

  resources :ads
  resources :types
end
