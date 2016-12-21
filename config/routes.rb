Rails.application.routes.draw do
  use_doorkeeper
  get 'users/profile'

  namespace :api do
    resources :observations
    get 'user', to: 'users#show'
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'api/observations#index'
    get 'users/profile', as: 'user_root'
end
