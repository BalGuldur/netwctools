require 'test_helper'

class VinosControllerTest < ActionController::TestCase
  setup do
    @vino = vinos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vinos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vino" do
    assert_difference('Vino.count') do
      post :create, vino: @vino.attributes
    end

    assert_redirected_to vino_path(assigns(:vino))
  end

  test "should show vino" do
    get :show, id: @vino.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vino.to_param
    assert_response :success
  end

  test "should update vino" do
    put :update, id: @vino.to_param, vino: @vino.attributes
    assert_redirected_to vino_path(assigns(:vino))
  end

  test "should destroy vino" do
    assert_difference('Vino.count', -1) do
      delete :destroy, id: @vino.to_param
    end

    assert_redirected_to vinos_path
  end
end
