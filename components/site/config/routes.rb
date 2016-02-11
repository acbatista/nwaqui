Site::Engine.routes.draw do
  root 'pages#index'

  resources :pages
  
  resources :sessions, only: [:new, :create]

  resources :bookmark_users, only: [:new, :create]
  resources :bookmarks

  get '/bookmark/:key', to: 'bookmarks#public_share'

  resources :properties do 
    collection do 
      resources :bookmarks
    end
  end

end

