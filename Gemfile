source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Assets of application
gem 'bootstrap-sass', '3.3.1'
gem 'font-awesome-rails', '4.4.0.0'
gem 'jquery-datatables-rails' , '3.3.0', path: 'vendor/jquery-datatables-rails-3.3.0'
gem 'rails-i18n', '~> 4.0.0'
gem 'bootstrap_notify', '0.0.5'

# Assets for datetime picker
gem 'momentjs-rails', '2.10.3' , path: 'vendor/momentjs-rails-2.10.3'
gem 'bootstrap3-datetimepicker-rails' , '4.15.35', path: 'vendor/bootstrap3-datetimepicker-rails-4.15.35'

gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
# Authentication of administrative control
gem 'devise', '3.5.2'

# Customize application ENV
gem 'figaro', '1.1.1'

# slide show
gem 'owlcarousel-rails'

# attachment file 
gem "paperclip", "~> 4.3"

# simple form
gem 'simple_form'

# will_paginate
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '3.3.3'
  gem 'factory_girl_rails', '~> 4.2.0'
  gem 'guard-rspec', '4.6.4', require: false
  gem 'capybara', '2.5.0'
  gem 'cucumber', '2.1.0'
end

group :test do
  gem 'shoulda'
  gem 'shoulda-matchers', require: false
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'quiet_assets'  

  # show as table when console sql
  gem 'pry-rails'
  gem "table_print"


end


