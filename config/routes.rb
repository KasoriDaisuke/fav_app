Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root  'fav_controller#index'
  match '/show',   to: 'fav_controller#show',   via: 'get'
end
