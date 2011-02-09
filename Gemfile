source 'http://rubygems.org'

gem 'rails', '~>3.0.0'
gem 'mysql2'
gem 'capistrano'
gem 'jquery-rails'
gem 'omniauth'
gem 'haml'
gem 'devise',:git => 'https://github.com/plataformatec/devise.git', :branch => 'v1.2.oauth'
gem 'compass'
#gem 'oa-oauth', :require => 'omniauth/oauth'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

group :development, :test do
  gem 'rspec-rails'
end

group :development do 
  gem 'mongrel'
end

group :test do
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'launchy'
end
