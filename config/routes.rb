# frozen_string_literal: true

Rails.application.routes.draw do 
  root to: 'ads#index'
  scope "/:locale", locale: /#{I18n.available_locales.join('|')}/ do
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

    resources :ads
    resources :types
  end
end
