# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'aasm' # state machine
gem 'acts-as-taggable-on', git: 'https://github.com/F3pix/acts-as-taggable-on' # tags
gem 'acts_as_list' # order post::blocks
gem 'annotate' # annotate models
gem 'autoprefixer-rails' # css prefixer
gem 'bootstrap-sass', '~> 3.3.4'
gem 'carrierwave' # file upload
gem 'codeclimate-test-reporter', group: :test, require: nil
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'font-awesome-rails'
gem 'has_secure_token'
gem 'jquery-fileupload-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'kaminari' # pagination
gem 'little_decorator' # decorator for models
gem 'local_time' # for human readable time
gem 'medium-editor-rails' # visual editor
gem 'mini_magick' # image processing
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'nprogress-rails' # progressbar for turbolinks
gem 'paranoia', '~> 2.0' # soft delete functional for AR models
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.0.rc1', git: 'https://github.com/rails/rails', branch: '5-1-stable'
gem 'rails_config' # Keep configurations clean
gem 'russian'
gem 'sass-rails', github: 'rails/sass-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
end

group :development do
  # gem 'web-console', '>= 3.3.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'mailcatcher', require: false
  gem 'sextant'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
