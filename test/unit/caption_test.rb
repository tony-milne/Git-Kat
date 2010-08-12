require "test/unit"
require "rubygems"
require "test/test_helper"
gem "selenium-client"
require "selenium/client"

class CaptionTest < Test::Unit::TestCase

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

  def test_captions_test
	registration_test
    @selenium.open "/"

# Upload an Asset
  @selenium.click "link=New asset"
  @selenium.wait_for_page_to_load "30000"
  @selenium.type "asset_title", "Test Asset"
  @selenium.click "link=Back"
  @selenium.wait_for_page_to_load "30000"
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

# Add A New Country
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
  @selenium.click "link=New asset"
  @selenium.wait_for_page_to_load "30000"
  @selenium.type "asset_title", "Test Asset"
  @selenium.type "asset_data", "C:\\Users\\Graham\\Documents\\mastersproject\\shared\\test\\files\\test.jpg"
  @selenium.click "asset_submit"
  @selenium.wait_for_page_to_load "30000"

# Add a caption
@selenium.click "link=Add/edit caption"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=New caption"
@selenium.wait_for_page_to_load "30000"
@selenium.type "caption_content", "Test Caption"
@selenium.click "caption_submit"
@selenium.wait_for_page_to_load "30000"
begin
assert @selenium.is_text_present("Test Caption")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
begin
assert @selenium.is_text_present("Test Language")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"

# Edit a caption
@selenium.click "link=Add/edit caption"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Edit"
@selenium.wait_for_page_to_load "30000"
@selenium.type "caption_content", "Test Caption Edit"
@selenium.click "caption_submit"
@selenium.wait_for_page_to_load "30000"
begin
assert @selenium.is_text_present("Test Caption Edit")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
begin
assert @selenium.is_text_present("Test Language")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end

# Delete a caption
@selenium.click "link=Delete"
assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
  end

  def teardown
	teardown_test
	end

end
