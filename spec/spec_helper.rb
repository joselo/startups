require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'  
  #require "paperclip/matchers"
  #include Devise::TestHelpers

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  #Dir[Rails.root.join("spec/acceptance/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.before(:each){ reset_email }

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true

    config.include MailerMacros
    #config.include HelperMethods
    #config.include NavigationHelpers
    #config.include Paperclip::Shoulda::Matchers

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end

  ActiveRecord::ConnectionAdapters::ConnectionPool.class_eval do
    def current_connection_id
      Thread.main.object_id
    end
  end

  Capybara.javascript_driver = :webkit

end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
end

