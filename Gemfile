source 'https://rubygems.org'


gem 'rails', '4.2.5.1'

gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

gem 'turbolinks'

gem 'simple_form'
gem 'haml-rails'

path 'components' do 
  gem 'site'
  gem 'client'
  gem 'admin'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
end


group :production do 
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'
end