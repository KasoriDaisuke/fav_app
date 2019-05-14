Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  root  'fav_controller#index'
  get  'fav_controller/index' => 'fav_controller#get_tweet'

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
end
