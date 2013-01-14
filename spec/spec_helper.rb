ENV["RAILS_ENV"] = 'test'
path_to_test_store = '../dummy';

require File.expand_path("#{path_to_test_store}/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'rspec/autorun'
require 'spree/core/testing_support/controller_requests'
require 'spree/core/url_helpers'
#require 'database_cleaner'
#require 'capybara/poltergeist'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("#{path_to_test_store}/db/migrate/", __FILE__)

# Requires factories defined in spree_core
require 'spree/core/testing_support/factories'
require 'spree/core/testing_support/controller_requests'
require 'spree/core/url_helpers'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # == URL Helpers
  #
  # Allows access to Spree's routes in specs:
  #
  # visit spree.admin_path
  # current_path.should eql(spree.products_path)
  config.include Spree::Core::UrlHelpers
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, comment the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.include Spree::Core::TestingSupport::ControllerRequests, :type => :controller
end
