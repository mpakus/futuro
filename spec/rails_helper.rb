# frozen_string_literal: true
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'awesome_print'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

FactoryGirl::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller

  config.include Warden::Test::Helpers

  config.after :each do
    Warden.test_reset!
    FileUtils.rm_rf(Dir["#{Rails.root}/system/files/"])
  end

  config.before :suite do
    Warden.test_mode!
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    Warden.test_reset!
    ActionMailer::Base.deliveries.clear
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.infer_base_class_for_anonymous_controllers = false

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
end
