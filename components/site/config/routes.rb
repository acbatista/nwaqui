Site::Engine.routes.draw do
  root 'pages#index'

  resources :pages
  
  resources :sessions, only: [:new, :create, :logout] do 
    collection do 
      get 'logout'
    end
  end
  resources :external_users
  
  resources :bookmark_users, only: [:new, :create]
  resources :bookmarks

  get '/bookmark/:key', to: 'bookmarks#public_share'

  resources :properties, path: 'imoveis'

end

