Rails.application.routes.draw do
  root "ads#index"

  resources :ads
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
