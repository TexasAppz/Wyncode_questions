require 'test_helper'

class DoingItemsControllerTest < ActionController::TestCase
  setup do
    @doing_item = doing_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doing_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doing_item" do
    assert_difference('DoingItem.count') do
      post :create, doing_item: { complete: @doing_item.complete, deadline: @doing_item.deadline, description: @doing_item.description, priority: @doing_item.priority, title: @doing_item.title }
    end

    assert_redirected_to doing_item_path(assigns(:doing_item))
  end

  test "should show doing_item" do
    get :show, id: @doing_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doing_item
    assert_response :success
  end

  test "should update doing_item" do
    patch :update, id: @doing_item, doing_item: { complete: @doing_item.complete, deadline: @doing_item.deadline, description: @doing_item.description, priority: @doing_item.priority, title: @doing_item.title }
    assert_redirected_to doing_item_path(assigns(:doing_item))
  end

  test "should destroy doing_item" do
    assert_difference('DoingItem.count', -1) do
      delete :destroy, id: @doing_item
    end

    assert_redirected_to doing_items_path
  end
end
