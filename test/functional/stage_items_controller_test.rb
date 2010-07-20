require 'test_helper'

class StageItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stage_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage_item" do
    assert_difference('StageItem.count') do
      post :create, :stage_item => { }
    end

    assert_redirected_to stage_item_path(assigns(:stage_item))
  end

  test "should show stage_item" do
    get :show, :id => stage_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stage_items(:one).to_param
    assert_response :success
  end

  test "should update stage_item" do
    put :update, :id => stage_items(:one).to_param, :stage_item => { }
    assert_redirected_to stage_item_path(assigns(:stage_item))
  end

  test "should destroy stage_item" do
    assert_difference('StageItem.count', -1) do
      delete :destroy, :id => stage_items(:one).to_param
    end

    assert_redirected_to stage_items_path
  end
end
