require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    u = User.find_by_username('aaron')
    user_session = UserSession.new(u)
    post :create, :user_session => user_session
    assert_response :ok
  end
  
  def test_destroy
    u = User.find_by_username('quentin')
    UserSession.create(u)
    delete :destroy
    assert_redirected_to root_url
    assert_nil UserSession.find
  end
end
