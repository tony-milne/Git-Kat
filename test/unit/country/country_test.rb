require "test/unit"
require "test/test_helper"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class CountryTest < Test::Unit::TestCase

def setup
	setup_test
	registration_test
end
    
def test_createcountry_test
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
  end
  
def test_editcountry_test
  	  @selenium.click "link=New Country"
      @selenium.wait_for_page_to_load "30000"
      @selenium.click "link=Edit"
      @selenium.wait_for_page_to_load "30000"
      @selenium.type "country_name", "Test Country Edit"
      @selenium.click "country_submit"
      @selenium.wait_for_page_to_load "30000"
      @selenium.click "link=Back"
      @selenium.wait_for_page_to_load "30000"
      @selenium.click "link=Assets Homepage"
end

def test_deletecountry_test
      @selenium.wait_for_page_to_load "30000"
      @selenium.click "link=New Country"
      @selenium.wait_for_page_to_load "30000"
      @selenium.click "link=Destroy"
      assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
      @selenium.click "link=Assets Homepage"
      @selenium.wait_for_page_to_load "30000"
end

def teardown
     @selenium.click "link=Logout"
    @selenium.wait_for_page_to_load "30000"
	 @selenium.close_current_browser_session
    assert_equal [], @verification_errors

end

end
