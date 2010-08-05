require 'test_helper'

class AssetManager::CountriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_manager_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country" do
    assert_difference('AssetManager::Country.count') do
      post :create, :country => { }
    end

    assert_redirected_to country_path(assigns(:country))
  end

  test "should show country" do
    get :show, :id => asset_manager_countries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asset_manager_countries(:one).to_param
    assert_response :success
  end

  test "should update country" do
    put :update, :id => asset_manager_countries(:one).to_param, :country => { }
    assert_redirected_to country_path(assigns(:country))
  end

  test "should destroy country" do
    assert_difference('AssetManager::Country.count', -1) do
      delete :destroy, :id => asset_manager_countries(:one).to_param
    end

    assert_redirected_to asset_manager_countries_path
  end
end
