Admin::Engine.routes.draw do

  root 'pages#home'
  
  resources :pages 
  resources :region_scopes 
    
  resources :sessions do 
    collection do 
      get 'logout'
    end
  end

  get   'edit_password',  to: 'passwords#edit', as: 'edit_password'
  post  'update_password', to: 'passwords#update', as: 'update_password'

  resources :properties do 
    resources :property_images
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

  resources :buttons
  resources :customers
  resources :message_contacts
  resources :bookmark_contacts

  resources :admin_users
  resources :attributes
  resources :specials

end
  