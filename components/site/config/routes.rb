Site::Engine.routes.draw do
  root 'pages#index'

  resources :lists, only: [:index], path: 'lista'
  resources :pages
  
  resources :sessions, only: [:new, :create, :logout] do 
    collection do 
      get 'logout'
    end
  end

  resources :external_users

  get 'auth/:provider/callback', to: 'sessions#gmail_session_create', as: 'gmail_session_create'
  
  resources :bookmarks do 
    get 'delete'
    collection do 
      get 'public', to: 'bookmarks#public'
      get 'share', to: 'bookmarks#share'
    end
  end

  get '/bookmark/:key', to: 'bookmarks#public_share'
  get '/search', path: 'pesquisa', to: 'properties#search', as: 'search'

  resources :properties, path: 'imoveis' do 
    get 'telephone'
    resources :messages, only: [:new, :create]
  end

end

