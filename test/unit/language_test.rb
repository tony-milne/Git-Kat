require "test/unit"
require "rubygems"
require "test/test_helper"
gem "selenium-client"
require "selenium/client"

class LanguageTest < Test::Unit::TestCase

def setup
  @verification_errors = []
  @selenium = Selenium::Client::Driver.new \
    :host => "localhost",
    :port => 4444,
    :browser => "*chrome",
    :url => "http://localhost:3001",
    :timeout_in_second => 60

  @selenium.start_new_browser_session
  end

  def test_languages_test
registration_test
    assert_equal [], @verification_errors  
    @selenium.open "/"
    @selenium.click "link=View Languages"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=New language"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "language_language", "Test Language"
    @selenium.click "language_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Back"
    @selenium.wait_for_page_to_load "30000"
    assert_equal [], @verification_errors
    begin
        assert @selenium.is_text_present("Test Language")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
        assert_equal [], @verification_errors
    end
    @selenium.click "link=Edit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "language_language", "Test Language 2"
    @selenium.click "language_submit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Back"
    @selenium.wait_for_page_to_load "30000"
    assert_equal [], @verification_errors
    begin
        assert @selenium.is_text_present("Test Language 2")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
        assert_equal [], @verification_errors
    end
    @selenium.click "link=Delete"
    assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
    @selenium.click "link=Back"
    @selenium.wait_for_page_to_load "30000"
    assert_equal [], @verification_errors
  end

  def teardown
	teardown_test
	end

end
