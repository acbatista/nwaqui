Client::Engine.routes.draw do
  root 'pages#index'
  
  resources :pages, only: [:index]
  
  resources :properties do 
    resources :property_images
  end

  resources :messages do 
    get 'read'
    get 'unread'
  end

  resources :sessions do 
    collection do 
      get 'logout'
    end
  end

  resources :addresses do 
    collection do 
      get 'groups'
      get 'blocks'
      get 'block'
    end

    resources :groups do 
      resources :blocks
    end
  end

  get   'edit_password',  to: 'passwords#edit', as: 'edit_password'
  post  'update_password', to: 'passwords#update', as: 'update_password'

  resources :users, only: [:show, :update, :edit] do 
    collection do 
      resources :passwords, only: [:edit, :update]
    end
  end
end
