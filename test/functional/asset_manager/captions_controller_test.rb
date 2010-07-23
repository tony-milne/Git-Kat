require 'test_helper'

class AssetManager::CaptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_manager_captions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caption" do
    assert_difference('AssetManager::Caption.count') do
      post :create, :caption => { }
    end

    assert_redirected_to caption_path(assigns(:caption))
  end

  test "should show caption" do
    get :show, :id => asset_manager_captions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asset_manager_captions(:one).to_param
    assert_response :success
  end

  test "should update caption" do
    put :update, :id => asset_manager_captions(:one).to_param, :caption => { }
    assert_redirected_to caption_path(assigns(:caption))
  end

  test "should destroy caption" do
    assert_difference('AssetManager::Caption.count', -1) do
      delete :destroy, :id => asset_manager_captions(:one).to_param
    end

    assert_redirected_to asset_manager_captions_path
  end
end
