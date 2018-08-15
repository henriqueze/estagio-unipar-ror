source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

#Integrate Select2 javascript library with Rails asset pipeline
gem "select2-rails"
#Jquery::Inputmask::Rails
gem 'jquery-inputmask-rails'

#Select2 is a jQuery based replacement for select boxes. It supports searching, remote data sets, and infinite scrolling of results.
#gem 'rails-assets-select2', source: 'https://rails-assets.org'

# Forularios
gem 'simple_form'
#Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms
gem "cocoon"
#This gem does some CPF/CNPJ magic.
gem "cpf_cnpj"
#Some ActiveModel/ActiveRecord validators
gem "validators"
#This gem provides jQuery and the jQuery-ujs driver for your Rails 4+ application.
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
#A simple, versatile notification library
gem 'rails-assets-notifyjs', source: 'https://rails-assets.org'
#Tables plug-in for jQuery
gem 'rails-assets-DataTables', source: 'https://rails-assets.org'
#Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff
gem 'rails-i18n'
#Manage Procfile-based applications
gem 'foreman'
#Flexible authentication solution for Rails with Warden.
gem 'devise'
#Translations for the devise gem
gem 'devise-i18n'
#Rails gem of the Bootstrap based admin theme SB Admin 2.
gem 'bootstrap_sb_admin_base_v2'
#bootstrap
gem 'rails-assets-bootstrap', source: 'https://rails-assets.org'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #Better error page for Rack apps
  gem 'better_errors'
  gem 'binding_of_caller'
  # Generate Entity-Relationship Diagrams for Rails applications
  gem 'rails-erd'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
