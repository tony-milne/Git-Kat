require "test/unit"
require "rubygems"
require "test/test_helper"
gem "selenium-client"
require "selenium/client"

class StageTest < Test::Unit::TestCase

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

	@selenium.open "/"
	@selenium.click "link=New Country"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New country"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "country_name", "Test Country"
	@selenium.click "country_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Assets Homepage"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	@selenium.click "link=New Tribe"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New tribe"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "tribe_name", "Test Tribe"
	@selenium.click "tribe_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Assets Homepage"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	@selenium.click "link=New asset"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "asset_title", "Test Asset"
	@selenium.type "asset_data", "C:\\Users\\Public\\Pictures\\Sample Pictures\\Tree.jpg"
	@selenium.click "asset_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New stage"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "stage_title", "Test Stage"
	@selenium.click "stage_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "asset_ids_"
	@selenium.select "stage_stage_id", "label=Test Stage"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=View"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "asset_ids_"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Edit This Stage"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "stage_title", "Test Stage 2"
	@selenium.click "stage_submit"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	@selenium.click "link=View All Stages"
	@selenium.wait_for_page_to_load "30000"
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