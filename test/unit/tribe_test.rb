require "test/unit"
require "rubygems"
require "test/test_helper"
gem "selenium-client"
require "selenium/client"

class TribeTest < Test::Unit::TestCase

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

  def test_tribes_test
  registration_test 
  # Adding a tribe
  @selenium.click "link=New Tribe"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=New tribe"
  @selenium.wait_for_page_to_load "30000"
  @selenium.type "tribe_name", "Test Tribe"
  @selenium.click "tribe_submit"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Back"
  @selenium.wait_for_page_to_load "30000"
  begin
  assert @selenium.is_text_present("Test Tribe")
  rescue Test::Unit::AssertionFailedError
    @verification_errors << $!
  end 
  @selenium.click "link=Assets Homepage"
  @selenium.wait_for_page_to_load "30000"
  begin
	assert @selenium.is_text_present("Welcome To Your Asset Archive")
  rescue Test::Unit::AssertionFailedError
	@verification_errors << $!
end

  # Editing a tribe  
  @selenium.click "link=New Tribe"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Edit"
  @selenium.wait_for_page_to_load "30000"
  @selenium.type "tribe_name", "Test Tribe Edit"
  @selenium.click "tribe_submit"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Back"
  @selenium.wait_for_page_to_load "30000"
  begin
    assert @selenium.is_text_present("Test Tribe Edit")
  rescue Test::Unit::AssertionFailedError
    @verification_errors << $!
  end
	@selenium.click "link=Assets Homepage"
	@selenium.wait_for_page_to_load "30000"
  begin
	assert @selenium.is_text_present("Welcome To Your Asset Archive")
  rescue Test::Unit::AssertionFailedError
	@verification_errors << $!
  end
  
  @selenium.click "link=New Tribe"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Destroy"
  assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation


  end

  def teardown
	teardown_test
	end

end
