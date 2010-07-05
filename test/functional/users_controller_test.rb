require 'test_helper'

class UsersControllerTest < ActionController::TestCase
#fixtures aren't needed since using transactional fixtures, looks in test database instead

  setup do
    u = User.find_by_username('quentin')
    UserSession.create(u)
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid #is invalid since no details are specified
    post :create, :user => { :username => 'test3' }
    assert_template 'new'
  end
  
  def test_create_valid
    post :create, :user => { :username => 'test4', :email => 'test@test.com', :password => 'test_pass', :password_confirmation => 'test_pass' }
    assert_redirected_to root_url
  end
  
  def test_edit #:id => :current refers to user/session used in setup
    get :edit, :id => :current
    assert_template 'edit'
  end
  
  def test_update_invalid #update fails since empty username and password used
    put :update, :id => :current, :user => { :username => '', :password => '' }
    assert_template 'edit'
  end
  
  def test_update_valid #update passes since new password and confirmation is used
    put :update, :id => :current, :user => { :password => 'test1', :password_confirmation => 'test1' }
    assert_redirected_to root_url
  end
end