source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.1.4', '>= 6.1.4.4'

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.7'

gem 'bcrypt', '~> 3.1.7'

gem 'base64', '~> 0.1.1'

gem 'pg', '~> 1.3', '>= 1.3.2'

# Css library
gem 'bootstrap', '~> 5.1', '>= 5.1.3'

gem 'jquery-rails', '~> 4.4'

# Email validation gem
gem 'email_validator', '~> 2.2', '>= 2.2.3'

# For send email with sendgrid
gem 'sendgrid-ruby'

# Json web token gem
gem 'jwt', '~> 2.4', '>= 2.4.1'

# Json web token helper gem
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

# gem 'formvalidation-rails', '~> 0.8.1'

# gem 'redis', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard-livereload', '~> 2.5', require: false
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'guard'
  gem 'guard-zeus'
  gem 'rack-livereload'
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


group :production do 
  #gem 'pg', '~> 1.3', '>= 1.3.2'
end