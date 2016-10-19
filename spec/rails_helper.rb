ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "spec_helper"
require "rspec/rails"
require "capybara/rails"
require "simplecov"
require "vcr"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
SimpleCov.start
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include Authentication
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
    with.library :action_controller
    with.library :rails
  end
end
