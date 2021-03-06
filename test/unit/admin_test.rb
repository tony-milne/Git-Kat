
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


  def test_admintest
  #This tests registration
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
	#This tests languages
	@selenium.click "link=View Languages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New language"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "language_language", "test"
	@selenium.click "language_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	#This tests countries
	@selenium.click "link=Manage Countries"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New country"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "country_name", "test"
	@selenium.click "country_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Assets Homepage"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	#This tests tribes
	@selenium.click "link=Manage Tribes"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=New tribe"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "tribe_name", "test"
	@selenium.click "tribe_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Assets Homepage"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	#This tests contracts
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
	# This tests stages
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
	#This tests assets
	@selenium.click "link=New asset"
	@selenium.wait_for_page_to_load "30000"
	@selenium.type "asset_title", "test"
	@selenium.select "asset_country_id", "label=test"
	@selenium.select "asset_tribe_id", "label=test"
	@selenium.click "link=Add a tag"
	@selenium.type "asset_new_tag_attributes__content", "test"
	@selenium.click "link=Add Credit"
	@selenium.type "asset_new_credit_attributes__content", "test"
	@selenium.select "asset_new_credit_attributes__language_id", "label=test"
	@selenium.click "link=Add a caption"
	@selenium.type "asset_new_caption_attributes__content", "test"
	@selenium.select "asset_new_caption_attributes__language_id", "label=test"
	@selenium.type "asset_data", "C:\\rails\\shared\\test\\files\\test.jpg"
	@selenium.click "asset_submit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.select "stage_id", "label=test"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "asset_id_1"
	@selenium.click "commit"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Select another stage"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
	#This tests deleting a stage
	@selenium.click "link=View Stages"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	@selenium.click "link=Back"
	@selenium.wait_for_page_to_load "30000"
	@selenium.click "link=Delete"
	assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
	#This tests logout
	@selenium.click "link=Logout"
	@selenium.wait_for_page_to_load "30000"
	assert_equal [], @verification_errors
  end
  
    def teardown
	@selenium.close_current_browser_session
	assert_equal [], @verification_errors
  end

end
