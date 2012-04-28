source 'http://rubygems.org'
source 'http://gemcutter.org'

gem 'thin'

gem 'rails', '3.1.3'

gem 'pg'
gem 'json'

gem 'omniauth', :git => 'git://github.com/intridea/omniauth.git'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

gem 'haml'
gem 'hpricot'
gem 'ruby_parser'

group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'annotate'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'fakeweb'
  gem 'launchy'
  gem 'database_cleaner', :group => :test
  gem 'faker'
  gem 'pry'
  gem 'rest-client'

  #if RUBY_PLATFORM.downcase.include?('darwin')
  #  gem 'guard'
  #  gem 'guard-rspec'
  #  gem 'guard-cucumber'
  #  gem 'guard-bundler'
  #  gem 'guard-spork'
  #  gem 'spork'
  #  gem 'rb-fsevent'
  #  gem 'growl' # also install growlnotify from the Extras/growlnotify/growlnotify.pkg in Growl disk image
  #end
end

group :test do
  gem 'cucumber-rails', require: false
end

group :development do
  gem 'pry'
end

gem 'execjs'
gem 'therubyracer'
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'nested_form', :git => 'git://github.com/fxposter/nested_form.git'
gem 'jquery-rails'
gem 'cancan'
gem 'make_voteable'
gem 'rails_autolink'
gem 'moredown'
gem 'delayed_job'
gem 'delayed_job_active_record'