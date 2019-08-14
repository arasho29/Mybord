Rails.application.routes.draw do

  post '/users/:id', to: 'password_resets#update'
  get '/login', to: 'auths#new'
  post '/login', to: 'auths#create'
  delete '/logout', to: 'auths#destroy'

  resources :posts
  resources :users
  resources :password_resets, only: [:edit, :update]
  root 'posts#index'
end
