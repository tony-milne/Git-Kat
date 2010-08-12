require "test/unit"
require "rubygems"
require "test/test_helper"
gem "selenium-client"
require "selenium/client"

class CountryTest < Test::Unit::TestCase

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

  def test_countries_test
registration_test
	assert_equal [], @verification_errors
  @selenium.open "/asset_manager/assets"
	@selenium.click "link=New Country"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New country"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "country_name", "Test Country"
	@selenium.click "country_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	begin
		assert @selenium.is_text_present("Test Country")
	rescue Test::Unit::AssertionFailedError
		@verification_errors << $!
		assert_equal [], @verification_errors
	end
	@selenium.click "link=Edit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "country_name", "Test Country 2"
	@selenium.click "country_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	begin
		assert @selenium.is_text_present("Test Country 2")
	rescue Test::Unit::AssertionFailedError
		@verification_errors << $!
		assert_equal [], @verification_errors
	end
	@selenium.click "link=Destroy"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	@selenium.click "link=Assets Homepage"
	@selenium.wait_for_page_to_load "30000"
	begin
		assert @selenium.is_text_present("Welcome To Your Asset Archive")
	rescue Test::Unit::AssertionFailedError
		@verification_errors << $!
		assert_equal [], @verification_errors
	end
  end
    def teardown
teardown_test
end

end