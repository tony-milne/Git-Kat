require "test/unit"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class RegistrationTest < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://localhost:3001/",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end
  
  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end
  
  def test_user_registration
    @selenium.open "/login"
    @selenium.click "link=register"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "user_username", "Test"
    @selenium.type "user_email", "test@test.com"
    @selenium.type "user_password", "test123"
    @selenium.type "user_password_confirmation", "test123"
    @selenium.click "user_submit"
    @selenium.wait_for_page_to_load "30000"
  end
end
