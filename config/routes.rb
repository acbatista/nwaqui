Rails.application.routes.draw do
  root 'site/pages#index'

  get 'auth/:provider/callback', to: 'site/sessions#omniauth_create', as: 'omniauth_create'
  
  mount Site::Engine    => '/site'
  mount Admin::Engine   => '/gestao'
  mount Client::Engine  => '/cliente'
end
