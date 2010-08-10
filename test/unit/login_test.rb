
require "test/unit"
require "test/test_helper"
require "rubygems"
gem "selenium-client"
require "selenium/client"
#require "test/unit/registration_test.rb"
#require "test/unit/helpers/registration_helper_test"

class LoginTest < Test::Unit::TestCase

def setup
setup_test
registration_test
end


  def test_login_test
    @selenium.open "/login"
    @selenium.type "user_session_username", "test"
    @selenium.type "user_session_password", "test1"
    @selenium.click "user_session_submit"
    @selenium.wait_for_page_to_load "30000"
  end
  
  def teardown
  @selenium.close_current_browser_session
  assert_equal [], @verification_errors
end
  
end
