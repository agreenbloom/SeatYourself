Rails.application.routes.draw do


  resources :locations
  root :to => 'welcome#index'

  resources :user_sessions
  resources :users
  resources :locations
  resources :categories, only: [:show, :index]
  resources :restaurants do
    resources :reservations, only: [:index, :create]
  end


  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get "signup" => "users#new", :as => "sign_up"

end