require 'test_helper'

class AssetManager::CreditsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_manager_credits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit" do
    assert_difference('AssetManager::Credit.count') do
      post :create, :credit => { }
    end

    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should show credit" do
    get :show, :id => asset_manager_credits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asset_manager_credits(:one).to_param
    assert_response :success
  end

  test "should update credit" do
    put :update, :id => asset_manager_credits(:one).to_param, :credit => { }
    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should destroy credit" do
    assert_difference('AssetManager::Credit.count', -1) do
      delete :destroy, :id => asset_manager_credits(:one).to_param
    end

    assert_redirected_to asset_manager_credits_path
  end
end
