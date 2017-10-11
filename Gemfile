source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '>= 3.1.2', platforms: :ruby # (gem install bcrypt --platform=ruby)
gem 'bootstrap-kaminari-views'
gem 'bootstrap-sass', '~> 3.3.0'
gem 'cancan'
gem 'carrierwave'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'enumerize'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'popper_js', '~> 1.12.3'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'sprockets-rails'
gem 'simple_form'
gem 'sqlite3'
gem 'slim'
gem 'state_machines-activerecord'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_girl_rails', '~> 4.0' # config.include FactoryGirl::Syntax::Methods - to rails_helper
  gem 'rake'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'state_machines-rspec'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
