require "test/unit"
require "test/test_helper"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class TribeTest < Test::Unit::TestCase

def setup
setup_test
registration_test
end
  

  def CreateTribe_test
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
  end
  
  def EditTribe_test
  @selenium.click "link=New Tribe"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Edit"
  @selenium.wait_for_page_to_load "30000"
  @selenium.type "tribe_name", "Test Tribe Edit"
  @selenium.click "tribe_submit"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Back"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Assets Homepage"
  @selenium.wait_for_page_to_load "30000"
  end

def DeleteTribe_test
  @selenium.click "link=New Tribe"
  @selenium.wait_for_page_to_load "30000"
  @selenium.click "link=Destroy"
  assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
  @selenium.click "link=Assets Homepage"
  @selenium.wait_for_page_to_load "30000"
end


  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end

end
