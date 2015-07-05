Rails.application.routes.draw do

  root :to => 'restaurants#index'

  resources :user_sessions
  resources :users
  resources :categories, only: [:show, :index]
  resources :restaurants do
    resources :reservations
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end