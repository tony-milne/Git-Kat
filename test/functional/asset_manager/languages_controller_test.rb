require 'test_helper'

class AssetManager::LanguagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_manager_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create language" do
    assert_difference('AssetManager::Language.count') do
      post :create, :language => { }
    end

    assert_redirected_to language_path(assigns(:language))
  end

  test "should show language" do
    get :show, :id => asset_manager_languages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => asset_manager_languages(:one).to_param
    assert_response :success
  end

  test "should update language" do
    put :update, :id => asset_manager_languages(:one).to_param, :language => { }
    assert_redirected_to language_path(assigns(:language))
  end

  test "should destroy language" do
    assert_difference('AssetManager::Language.count', -1) do
      delete :destroy, :id => asset_manager_languages(:one).to_param
    end

    assert_redirected_to asset_manager_languages_path
  end
end
