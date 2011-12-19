require 'test_helper'

class OutinsControllerTest < ActionController::TestCase
  setup do
    @outin = outins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outin" do
    assert_difference('Outin.count') do
      post :create, outin: @outin.attributes
    end

    assert_redirected_to outin_path(assigns(:outin))
  end

  test "should show outin" do
    get :show, id: @outin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outin.to_param
    assert_response :success
  end

  test "should update outin" do
    put :update, id: @outin.to_param, outin: @outin.attributes
    assert_redirected_to outin_path(assigns(:outin))
  end

  test "should destroy outin" do
    assert_difference('Outin.count', -1) do
      delete :destroy, id: @outin.to_param
    end

    assert_redirected_to outins_path
  end
end
