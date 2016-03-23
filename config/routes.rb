Rails.application.routes.draw do
  root 'site/pages#index'

  get "/auth/:provider/callback", to: "site/sessions#omniauth_create"
  get "/auth/failure", to: "site/sessions#omniauth_failure"
  get "/logout", to: "site/sessions#omniauth_destroy", :as => "logout"

  mount Site::Engine    => '/site'
  mount Admin::Engine   => '/gestao'
  mount Client::Engine  => '/cliente'
end
