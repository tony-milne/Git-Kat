require 'test_helper'

class AssetManager::TribesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_manager_tribes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tribe" do
    assert_difference('AssetManager::Tribe.count') do
      post :create, :tribe => { }
    end

    assert_redirected_to tribe_path(assigns(:tribe))
  end

  test "should show tribe" do
    get :show, :id => asset_manager_tribes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asset_manager_tribes(:one).to_param
    assert_response :success
  end

  test "should update tribe" do
    put :update, :id => asset_manager_tribes(:one).to_param, :tribe => { }
    assert_redirected_to tribe_path(assigns(:tribe))
  end

  test "should destroy tribe" do
    assert_difference('AssetManager::Tribe.count', -1) do
      delete :destroy, :id => asset_manager_tribes(:one).to_param
    end

    assert_redirected_to asset_manager_tribes_path
  end
end
