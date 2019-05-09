Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root  'fav_controller#index'
  get  'fav_controller/index' => 'fav_controller#get_tweet'
end
