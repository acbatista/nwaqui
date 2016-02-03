Rails.application.routes.draw do
  mount Site::Engine    => '/site'
  mount Admin::Engine   => '/gestao'
  mount Client::Engine  => '/cliente'
end
