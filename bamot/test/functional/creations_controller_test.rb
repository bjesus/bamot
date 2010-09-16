require 'test_helper'

class CreationsControllerTest < ActionController::TestCase
  setup do
    @creation = creations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:creations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create creation" do
    assert_difference('Creation.count') do
      post :create, :creation => @creation.attributes
    end

    assert_redirected_to creation_path(assigns(:creation))
  end

  test "should show creation" do
    get :show, :id => @creation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @creation.to_param
    assert_response :success
  end

  test "should update creation" do
    put :update, :id => @creation.to_param, :creation => @creation.attributes
    assert_redirected_to creation_path(assigns(:creation))
  end

  test "should destroy creation" do
    assert_difference('Creation.count', -1) do
      delete :destroy, :id => @creation.to_param
    end

    assert_redirected_to creations_path
  end
end
