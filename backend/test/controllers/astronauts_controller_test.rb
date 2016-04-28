require 'test_helper'

class AstronautsControllerTest < ActionController::TestCase
  setup do
    @astronaut = astronauts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:astronauts)
  end

  test "should create astronaut" do
    assert_difference('Astronaut.count') do
      post :create, astronaut: { birthdate: @astronaut.birthdate, mission_id: @astronaut.mission_id, name: @astronaut.name, space_station_id: @astronaut.space_station_id }
    end

    assert_response 201
  end

  test "should show astronaut" do
    get :show, id: @astronaut
    assert_response :success
  end

  test "should update astronaut" do
    put :update, id: @astronaut, astronaut: { birthdate: @astronaut.birthdate, mission_id: @astronaut.mission_id, name: @astronaut.name, space_station_id: @astronaut.space_station_id }
    assert_response 204
  end

  test "should destroy astronaut" do
    assert_difference('Astronaut.count', -1) do
      delete :destroy, id: @astronaut
    end

    assert_response 204
  end
end
