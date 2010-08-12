require "test/unit"
require "rubygems"
require "test/test_helper"
gem "selenium-client"
require "selenium/client"

class AssetTest < Test::Unit::TestCase

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

  def test_assets_test
registration_test 
  assert_equal [], @verification_errors 	
 # Add Country
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

# Add Tribe
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

# Add Languages
@selenium.click "link=View Languages"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=New language"
@selenium.wait_for_page_to_load "30000"
@selenium.type "language_language", "Test Language"
@selenium.click "language_submit"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
assert_equal [], @verification_errors


# Upload an Asset
@selenium.click "link=New asset"
@selenium.wait_for_page_to_load "30000"
@selenium.type "asset_title", "Test Asset"
@selenium.type "asset_data", "C:\\Users\\Graham\\Documents\\mastersproject\\shared\\test\\files\\test.jpg"
@selenium.click "asset_submit"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
assert_equal [], @verification_errors


# Edit the Assets Name
@selenium.click "link=Edit"
@selenium.wait_for_page_to_load "30000"
@selenium.type "asset_title", "Test Asset Edit"
@selenium.click "asset_submit"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"


#Delete the Asset
@selenium.click "link=Delete"
assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
assert_equal [], @verification_errors    

# Add An Asset With A Caption
@selenium.click "link=New asset"
@selenium.wait_for_page_to_load "30000"
@selenium.type "asset_title", "Test Asset"
@selenium.click "link=Add a caption"
@selenium.type "asset_new_caption_attributes__content", "Test Caption"
@selenium.type "asset_data", "C:\\Users\\Graham\\Documents\\mastersproject\\shared\\test\\files\\test.jpg"
@selenium.click "asset_submit"
@selenium.wait_for_page_to_load "30000"
assert_equal [], @verification_errors 
begin
assert @selenium.is_text_present("Test Caption")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Delete"
assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
assert_equal [], @verification_errors 

# Add An Asset With A Tag
@selenium.click "link=New asset"
@selenium.wait_for_page_to_load "30000"
@selenium.type "asset_title", "Test Asset"
@selenium.click "link=Add a tag"
@selenium.type "asset_new_tag_attributes__content", "Test Tag"
@selenium.type "asset_data", "C:\\Users\\Graham\\Documents\\mastersproject\\shared\\test\\files\\test.jpg"
@selenium.click "asset_submit"
@selenium.wait_for_page_to_load "30000"
assert_equal [], @verification_errors 
begin
assert @selenium.is_text_present("Test Tag")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Delete"
assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
assert_equal [], @verification_errors 

# Add An Asset With A Credit
@selenium.click "link=New asset"
@selenium.wait_for_page_to_load "30000"
@selenium.type "asset_title", "Test Asset"
@selenium.click "link=Add Credit"
@selenium.type "asset_new_credit_attributes__content", "Test Credit"
@selenium.type "asset_data", "C:\\Users\\Graham\\Documents\\mastersproject\\shared\\test\\files\\test.jpg"
@selenium.click "asset_submit"
@selenium.wait_for_page_to_load "30000"
begin
assert @selenium.is_text_present("Test Credit")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end

  end

  def teardown
	teardown_test
	end

end
