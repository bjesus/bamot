require 'test_helper'

class GarinsControllerTest < ActionController::TestCase
  setup do
    @garin = garins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garin" do
    assert_difference('Garin.count') do
      post :create, :garin => @garin.attributes
    end

    assert_redirected_to garin_path(assigns(:garin))
  end

  test "should show garin" do
    get :show, :id => @garin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @garin.to_param
    assert_response :success
  end

  test "should update garin" do
    put :update, :id => @garin.to_param, :garin => @garin.attributes
    assert_redirected_to garin_path(assigns(:garin))
  end

  test "should destroy garin" do
    assert_difference('Garin.count', -1) do
      delete :destroy, :id => @garin.to_param
    end

    assert_redirected_to garins_path
  end
end
