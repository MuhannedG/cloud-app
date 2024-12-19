# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'devise'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'

# Require all files in spec/support/
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Ensure database schema is up to date
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts "Pending migrations detected! Please run: bin/rails db:migrate RAILS_ENV=test"
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  # Fixture Path
  config.fixture_paths = [Rails.root.join("spec", "fixtures")]

  # FactoryBot Configuration
  config.include FactoryBot::Syntax::Methods

  # Devise Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Warden::Test::Helpers, type: :feature

  # Capybara Configuration
  Capybara.default_driver = :selenium_chrome
  Capybara.javascript_driver = :selenium_chrome

  # Transactional Fixtures (DatabaseCleaner for Capybara)
  config.use_transactional_fixtures = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Inferred Spec Types
  config.infer_spec_type_from_file_location!

  # Filter Rails Backtrace
  config.filter_rails_from_backtrace!
end
