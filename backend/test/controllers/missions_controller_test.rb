require 'test_helper'

class MissionsControllerTest < ActionController::TestCase
  setup do
    @mission = missions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:missions)
  end

  test "should create mission" do
    assert_difference('Mission.count') do
      post :create, mission: { name: @mission.name }
    end

    assert_response 201
  end

  test "should show mission" do
    get :show, id: @mission
    assert_response :success
  end

  test "should update mission" do
    put :update, id: @mission, mission: { name: @mission.name }
    assert_response 204
  end

  test "should destroy mission" do
    assert_difference('Mission.count', -1) do
      delete :destroy, id: @mission
    end

    assert_response 204
  end
end
