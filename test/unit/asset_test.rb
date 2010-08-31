   require "test_helper"
require "test/unit"
require "rubygems"
require "selenium/client"
gem "selenium-client"

class AssetTest < Test::Unit::TestCase

def setup
	@verification_errors = []
	@selenium = Selenium::Client::Driver.new \
	  :host => "localhost",
	  :port => 4444,
	  :browser => "*chrome",
	  :url => "http://localhost:3000/",
	  :timeout_in_second => 60

	@selenium.start_new_browser_session
  end

  def teardown
	@selenium.close_current_browser_session
	assert_equal [], @verification_errors
  end


  def test_assettest
	 @selenium.open "/asset_manager/login"
	 #This tests registration
	@selenium.click "link=register"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "asset_user_username", "assettest"
	@selenium.type "asset_user_email", "assettest@assettest.com"
	@selenium.type "asset_user_password", "assettest1"
	@selenium.type "asset_user_password_confirmation", "assettest1"
	@selenium.click "asset_user_submit"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	#This tests profile editing
	@selenium.click "link=Edit Profile"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "asset_user_username", "assettest1"
	@selenium.type "asset_user_password", "assettest2"
	@selenium.type "asset_user_password_confirmation", "assettest2"
	@selenium.click "asset_user_submit"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	#This tests logging out
	@selenium.click "link=Logout"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
  end
  end
  
  
  def teardown
	@selenium.close_current_browser_session
	assert_equal [], @verification_errors
  end