require 'test_helper'

class VlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get autocreate" do
    get :autocreate
    assert_response :success
  end

  test "should get manualcreate" do
    get :manualcreate
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
