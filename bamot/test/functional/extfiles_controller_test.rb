require 'test_helper'

class ExtfilesControllerTest < ActionController::TestCase
  setup do
    @extfile = extfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extfile" do
    assert_difference('Extfile.count') do
      post :create, :extfile => @extfile.attributes
    end

    assert_redirected_to extfile_path(assigns(:extfile))
  end

  test "should show extfile" do
    get :show, :id => @extfile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @extfile.to_param
    assert_response :success
  end

  test "should update extfile" do
    put :update, :id => @extfile.to_param, :extfile => @extfile.attributes
    assert_redirected_to extfile_path(assigns(:extfile))
  end

  test "should destroy extfile" do
    assert_difference('Extfile.count', -1) do
      delete :destroy, :id => @extfile.to_param
    end

    assert_redirected_to extfiles_path
  end
end
