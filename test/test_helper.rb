ENV["RAILS_ENV"] = "test" #needs to be first to ensure that test env is used
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require "authlogic/test_case"
include Authlogic::TestCase #don't know if this is needed, please test with and without


class ActiveSupport::TestCase

  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  #
  # The only drawback to using transactional fixtures is when you actually 
  # need to test transactions.  Since your test is bracketed by a transaction,
  # any transactions started in your code will be automatically rolled back.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  #consider removing since not used
  def login_as(user)
    UserSession.create(users(user)) # logs a user in
  end

  def logout
    UserSession.find.destroy
  end

end

class ActionController::TestCase
  setup :activate_authlogic
end

def setup_test
  @verification_errors = []
  @selenium = Selenium::Client::Driver.new \
    :host => "localhost",
    :port => 4444,
    :browser => "*chrome",
    :url => "http://localhost:3001",
    :timeout_in_second => 60

  @selenium.start_new_browser_session
  end

  def login_test
    @selenium.open "/login"
    @selenium.type "user_session_username", "test"
    @selenium.type "user_session_password", "test1"
    @selenium.click "user_session_submit"
    @selenium.wait_for_page_to_load "30000"
  end


  def registration_test
  @selenium.open "/login"
  @selenium.click "link=register"
  @selenium.wait_for_page_to_load "30000"
  @selenium.type "user_username", "test"
  @selenium.type "user_email", "test@test.com"
  @selenium.type "user_password", "test1"
  @selenium.type "user_password_confirmation", "test1"
  @selenium.click "user_submit"
  @selenium.wait_for_page_to_load "30000"
  end

def teardown_test
@selenium.close_current_browser_session
assert_equal [], @verification_errors
end
