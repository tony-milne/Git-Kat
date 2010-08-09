require "test/unit"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class Login_Test < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://localhost:3000",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end
  
  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end
  
  def test_login
    @selenium.open "/login"
    @selenium.type "user_session_username", "quintus"
    @selenium.type "user_session_password", "kickass22"
    @selenium.click "user_session_submit"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("Home Page")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
  end
end
