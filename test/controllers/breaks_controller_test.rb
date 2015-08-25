require 'test_helper'

class BreaksControllerTest < ActionController::TestCase
  setup do
    @break = breaks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:breaks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create break" do
    assert_difference('Break.count') do
      post :create, break: { course: @break.course, message: @break.message }
    end

    assert_redirected_to break_path(assigns(:break))
  end

  test "should show break" do
    get :show, id: @break
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @break
    assert_response :success
  end

  test "should update break" do
    patch :update, id: @break, break: { course: @break.course, message: @break.message }
    assert_redirected_to break_path(assigns(:break))
  end

  test "should destroy break" do
    assert_difference('Break.count', -1) do
      delete :destroy, id: @break
    end

    assert_redirected_to breaks_path
  end
end
