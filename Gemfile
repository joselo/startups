# A sample Gemfile
source "http://rubygems.org"

gem "rails", "3.1.1"
gem 'pg'
gem 'google_url_shortener'
gem 'therubyracer'
gem 'omniauth', :git => 'git://github.com/intridea/omniauth.git', :tag => 'v0.3.0.rc3'
gem "haml-rails"
gem 'jquery-rails'
gem 'rails-i18n'
gem 'client_side_validations'
gem 'kaminari'
gem 'gravtastic'
gem 'thin'

#I know this should be included in the assets group :) this is here just to heroku
gem 'sass-rails', "  ~> 3.1.1"
gem 'compass',      '~> 0.11.5' 

group :assets do
  gem 'coffee-rails', "~> 3.1.1"
  gem 'uglifier',     '>= 1.0.3' 
end

group :test, :development do
  gem 'capybara'
  gem "capybara-webkit"
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'

  gem 'capistrano', '2.5.19'
  gem 'capistrano-ext', '1.2.1'
  gem 'rvm', '1.2.6'

  gem 'heroku'
end

group :test, :development do
  gem 'awesome_print', "~> 0.4.0"
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem "guard-rspec"  
end
