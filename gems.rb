source 'https://rubygems.org'
source 'https://rails-assets.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'rails', '5.2.2'
gem 'sqlite3', '~> 1.3.6'
gem 'puma', '~> 3.11'
gem 'devise', '~> 4.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3'
gem 'jquery-ui-rails', '~> 6.0'
gem 'font-awesome-rails', '~> 4.7'
gem 'rails-assets-bootstrap', '~> 4.3'

group :development, :test do
  gem 'annotate'
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
