Rails.application.routes.draw do

  get '/login', to: 'auths#new'
  post '/login', to: 'auths#create'
  delete '/logout', to: 'auths#destroy'

  resources :posts

  resources :users do
    member do
      get :password_edit
      post :password_update
    end
  end

  root 'posts#index'
end
