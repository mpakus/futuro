# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'
gem 'acts-as-taggable-on', git: 'https://github.com/F3pix/acts-as-taggable-on' # tags
gem 'acts_as_list' # order post::blocks
gem 'annotate' # annotate models
gem 'autoprefixer-rails' # css prefixer
gem 'bootstrap-sass', '~> 3.3.4'
gem 'carrierwave' # file upload
gem 'codeclimate-test-reporter', group: :test, require: nil
gem 'coffee-rails'
gem 'devise', github: 'plataformatec/devise', branch: :master
gem 'devise-bootstrap-views'
gem 'has_secure_token'
gem 'jquery-fileupload-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'kaminari' # pagination
gem 'little_decorator' # decorator for models
gem 'local_time' # for human readable time
gem 'medium-editor-rails' # visual editor
gem 'mini_magick' # image processing
gem 'mysql2', '~> 0.4.6'
gem 'nprogress-rails' # progressbar for turbolinks
gem 'paranoia', '~> 2.2' # soft delete functional for AR models
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1'
gem 'rails_config' # Keep configurations clean
gem 'russian'
gem 'sass-rails'
gem 'slim-rails', github: 'slim-template/slim-rails', branch: :master
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
  gem 'rubocop-rspec', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'fasterer', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'reek', require: false
  gem 'sextant'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
