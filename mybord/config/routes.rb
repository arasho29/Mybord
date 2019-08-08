Rails.application.routes.draw do

  get '/login', to: 'auths#new'
  post '/login', to: 'auths#create'
  delete '/logout', to: 'auths#destroy'

  resources :posts
  resources :users 
  root 'posts#index'
end
