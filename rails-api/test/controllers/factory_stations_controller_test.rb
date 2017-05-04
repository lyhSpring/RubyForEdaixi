require 'test_helper'

class FactoryStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factory_station = factory_stations(:one)
  end

  test "should get index" do
    get factory_stations_url, as: :json
    assert_response :success
  end

  test "should create factory_station" do
    assert_difference('FactoryStation.count') do
      post factory_stations_url, params: { factory_station: { factory_id: @factory_station.factory_id, station_id: @factory_station.station_id } }, as: :json
    end

    assert_response 201
  end

  test "should show factory_station" do
    get factory_station_url(@factory_station), as: :json
    assert_response :success
  end

  test "should update factory_station" do
    patch factory_station_url(@factory_station), params: { factory_station: { factory_id: @factory_station.factory_id, station_id: @factory_station.station_id } }, as: :json
    assert_response 200
  end

  test "should destroy factory_station" do
    assert_difference('FactoryStation.count', -1) do
      delete factory_station_url(@factory_station), as: :json
    end

    assert_response 204
  end
end
