Rails.application.routes.draw do
  root  'fav_controller#index'
  match '/show',   to: 'fav_controller#show',   via: 'get'
end
