Site::Engine.routes.draw do
  root 'pages#index'

  resources :pages
  
  resources :sessions, only: [:new, :create, :logout] do 
    collection do 
      get 'logout'
    end
  end

  resources :external_users
  resources :bookmarks do 
    get 'delete'
    collection do 
      get 'public', to: 'bookmarks#public'
      get 'share', to: 'bookmarks#share'
    end
  end

  get '/bookmark/:key', to: 'bookmarks#public_share'
  get '/search', to: 'properties#search', as: 'search'

  resources :properties, path: 'imoveis' do 
    
    get 'telephone'

    get   'new_message'
    post  'create_message'

  end

end

