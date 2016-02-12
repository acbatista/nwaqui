Admin::Engine.routes.draw do

  root 'pages#index'
  
  resources :sessions do 
    collection do 
      get 'logout'
    end
  end

  get   'edit_password',  to: 'passwords#edit', as: 'edit_password'
  post  'update_password', to: 'passwords#update', as: 'update_password'

  resources :properties
  resources :buttons

  resources :projects
  resources :customers

  resources :customer_users
  resources :admin_users

  resources :attributes

end
  