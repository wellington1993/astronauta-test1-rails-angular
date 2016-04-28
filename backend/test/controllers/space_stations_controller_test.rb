require 'test_helper'

class SpaceStationsControllerTest < ActionController::TestCase
  setup do
    @space_station = space_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_stations)
  end

  test "should create space_station" do
    assert_difference('SpaceStation.count') do
      post :create, space_station: { description: @space_station.description, name: @space_station.name }
    end

    assert_response 201
  end

  test "should show space_station" do
    get :show, id: @space_station
    assert_response :success
  end

  test "should update space_station" do
    put :update, id: @space_station, space_station: { description: @space_station.description, name: @space_station.name }
    assert_response 204
  end

  test "should destroy space_station" do
    assert_difference('SpaceStation.count', -1) do
      delete :destroy, id: @space_station
    end

    assert_response 204
  end
end
