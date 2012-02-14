require 'test_helper'

class TerminatePointsControllerTest < ActionController::TestCase
  setup do
    @terminate_point = terminate_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:terminate_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create terminate_point" do
    assert_difference('TerminatePoint.count') do
      post :create, terminate_point: @terminate_point.attributes
    end

    assert_redirected_to terminate_point_path(assigns(:terminate_point))
  end

  test "should show terminate_point" do
    get :show, id: @terminate_point.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @terminate_point.to_param
    assert_response :success
  end

  test "should update terminate_point" do
    put :update, id: @terminate_point.to_param, terminate_point: @terminate_point.attributes
    assert_redirected_to terminate_point_path(assigns(:terminate_point))
  end

  test "should destroy terminate_point" do
    assert_difference('TerminatePoint.count', -1) do
      delete :destroy, id: @terminate_point.to_param
    end

    assert_redirected_to terminate_points_path
  end
end
