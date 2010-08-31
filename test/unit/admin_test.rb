def setup
end
def teardown
end

def test_admintest	
	# This tests the admin user registration
	@selenium.open "/login"
	@selenium.click "link=register"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "admin_user_username", "admintest"
	@selenium.type "admin_user_email", "admintest@admintest.com"
	@selenium.type "admin_user_password", "admintest1"
	@selenium.type "admin_user_password_confirmation", "admintest1"
	@selenium.click "admin_user_submit"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests adding a new asset
	@selenium.click "link=New asset"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "asset_data", "C:\\rails\\shared\\test\\files\\test.jpg"
	@selenium.type "asset_title", "Test"
	# This tests adding a new tag
	@selenium.click "link=Add a tag"
	@selenium.type "asset_new_tag_attributes__content", "Test"
	# This tests adding a new credit
	@selenium.click "link=Add Credit"
	@selenium.type "asset_new_credit_attributes__content", "Test"
	# This tests adding a new caption
	@selenium.click "link=Add a caption"
	@selenium.type "asset_new_caption_attributes__content", "Test"
	@selenium.click "asset_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests adding a new contract
	@selenium.click "link=Manage Contracts"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Create a new contract"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "contract_title", "Test"
	@selenium.type "contract_content", "Test"
	@selenium.click "contract_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Home"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests adding a new stage
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New stage"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "stage_title", "Test"
	@selenium.click "stage_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Home"
	@selenium.wait_for_page_to_load "30000"
	@selenium.select "stage_id", "label=Test"
	@selenium.click "//option[@value='1']"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "asset_id_1"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Select another stage"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests for the presence of the asset on the stage
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=View"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests the deletion of the asset
	@selenium.click "link=Home"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	assert_equal [], @verification_errors
	# This tests the deletion of the stage
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests the deletion of the contracts
	@selenium.click "link=Manage Contracts"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	assert_equal [], @verification_errors
	#This returns the test to the homepage
	@selenium.click "//img[@alt='Banner-logo-en']"
	@selenium.wait_for_page_to_load "30000"
	end
	
=======
require "test_helper"
require "test/unit"
require "rubygems"
require "selenium/client"
gem "selenium-client"

class AdminTest < Test::Unit::TestCase

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

  def test_admintest
  # This tests the admin registration
	@selenium.open "/login"
	@selenium.click "link=register"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "admin_user_username", "admintest"
	@selenium.type "admin_user_email", "admintest@admintest.com"
	@selenium.type "admin_user_password", "admintest1"
	@selenium.type "admin_user_password_confirmation", "admintest1"
	@selenium.click "admin_user_submit"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests adding a new asset
	@selenium.click "link=New asset"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "asset_data", "C:\\rails\\shared\\test\\files\\test.jpg"
	@selenium.type "asset_title", "test"
	# This tests adding a new tag
	@selenium.click "link=Add a tag"
	@selenium.type "asset_new_tag_attributes__content", "test"
	# This tests adding a new credit
	@selenium.click "link=Add Credit"
	@selenium.type "asset_new_credit_attributes__content", "test"
	# This tests adding a new caption
	@selenium.click "link=Add a caption"
	@selenium.type "asset_new_caption_attributes__content", "test"
	@selenium.click "asset_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests adding a new contract
	@selenium.click "link=Manage Contracts"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Create a new contract"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "contract_title", "test"
	@selenium.type "contract_content", "test"
	@selenium.click "contract_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"

	@selenium.click "link=Home"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# Tests the creation of a new stage
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New stage"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "stage_title", "test"
	@selenium.click "stage_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Home"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests adding an asset to a stage
	@selenium.select "stage_id", "label=test"
	@selenium.click "//option[@value='1']"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "asset_id_1"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Select another stage"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests deleting a stage
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	# This tests deleting a contract
	@selenium.click "link=Manage Contracts"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	@selenium.click "//img[@alt='Banner-logo-en']"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	# This tests user logout
	@selenium.click "link=Logout"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
  end
  end
