ENV['RACK_ENV'] = 'test'

require 'coveralls'
Coveralls.wear!

require './app/data_mapper_setup'
require './app/server'

require 'database_cleaner'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
