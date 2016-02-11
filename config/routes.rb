Rails.application.routes.draw do
  root 'site/pages#index'

  mount Site::Engine    => '/site'
  mount Admin::Engine   => '/gestao'
  mount Client::Engine  => '/cliente'
end
