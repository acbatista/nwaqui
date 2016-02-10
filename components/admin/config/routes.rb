Admin::Engine.routes.draw do

  root 'pages#index'
  
  resources :sessions do 
    collection do 
      get 'logout'
    end
  end

  resources :users, only: [:show, :update, :edit] do 
    collection do 
      resources :passwords, only: [:edit, :update]
    end
  end

  resources :properties
  
  resources :projects do 
    resources :properties
  end
  
  resources :customers do 
    resources :projects
    resources :properties
  end

  resources :customer_users
  resources :admin_users

  resources :attributes

end
  