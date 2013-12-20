source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.2'					# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg'											# Use postgresql as the database for Active Record
gem 'unicorn'											# Use unicorn as the app server

gem 'sass-rails', '~> 4.0.0'				# Use SCSS for stylesheets
gem 'less-rails'
gem 'uglifier', '>= 1.3.0'					# Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'			# Use CoffeeScript for .js.coffee assets and views
gem 'therubyracer', :require => 'v8'
gem 'figaro'                        # global env vars for config
gem 'jquery-rails'									# Use jquery as the JavaScript library
gem 'turbolinks'										# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 1.2'						# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'mailcatcher'

# GRAPHING
gem 'rickshaw_rails'                # graphing with scatter plots
gem 'devise'												# Authentication
gem 'high_voltage'									# STATIC PAGES

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara', '2.2.0'
  gem 'simplecov'
  gem 'shoulda-matchers'						# cleaner, simpler tests with great validation testing
  gem 'guard'
  gem 'guard-rspec'
  # gem 'libnotify' if /linux/ =~ RUBY_PLATFORM
  gem 'growl' # if /darwin/ =~ RUBY_PLATFORM
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-debugger'
end

group :development do
  gem 'better_errors'             # more helpful error screens for dev
  gem 'binding_of_caller'         # enable REPL and local/instance variable inspection
end

group :test do
  gem 'cucumber-rails', '~> 1.4.0', :require => false
  gem 'selenium-webdriver', '2.35.1'
  gem 'annotate'
  gem 'factory_girl_rails', '4.2.0'
  gem 'database_cleaner'          # removed github address because of PEM auth issues
  gem 'vcr'                       # record test suite http interactions for playback in future tests
  gem 'webmock'                   # lib for stubbing and setting expectation on HTTP requests
  gem 'launchy'

end

group :production do
  gem 'rails_12factor', '0.0.2'
end

group :doc do
  gem 'sdoc'											# bundle exec rake doc:rails generates the API under doc/api.
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0', :require => 'bcrypt'
gem 'redcarpet'
gem 'fabrication'										# object generation library
gem "momentjs-rails"
gem "rickshaw_rails"
gem "jquery-ui-rails", "2.0.2"