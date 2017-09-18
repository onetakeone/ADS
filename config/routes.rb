Rails.application.routes.draw do
  root "ads#index"
  get "users", to: "users#index"
  get "users/:id/edit", to: "users#edit"
  
  resources :ads
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
