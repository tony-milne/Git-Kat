require "test/unit"
require "test/test_helper"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class LanguageTest < Test::Unit::TestCase

def setup
setup_test
registration_test
end
  
def test_addlanguage_test
@selenium.click "link=New Language"
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
end

def test_editlanguage_test
@selenium.click "link=New Language"
@selenium.wait_for_page_to_load "30000"
@selenium.click "//div[@id='content']/table/tbody/tr[8]/td[2]/a"
@selenium.wait_for_page_to_load "30000"
@selenium.type "language_language", "Test Language Edit"
@selenium.click "language_submit"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
end


def test_deletelanguage_test
@selenium.click "link=New Language"
@selenium.wait_for_page_to_load "30000"
@selenium.click "//div[@id='content']/table/tbody/tr[8]/td[3]/a"
assert /^Are you sure[\s\S]$/ =~ @selenium.get_confirmation
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
end

def CheckLanguageMigration_test
@selenium.click "link=New Language"
@selenium.wait_for_page_to_load "30000"
begin
assert @selenium.is_text_present("English")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
begin
assert @selenium.is_text_present("Nederlands")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
begin
assert @selenium.is_text_present("Deutsch")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
@selenium.click "link=Back"
@selenium.wait_for_page_to_load "30000"
begin
assert @selenium.is_text_present("Welcome To Your Asset Archive")
rescue Test::Unit::AssertionFailedError
@verification_errors << $!
end
end

def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
end


end
