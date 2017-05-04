require 'test_helper'

class CouriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier = couriers(:one)
  end

  test "should get index" do
    get couriers_url, as: :json
    assert_response :success
  end

  test "should create courier" do
    assert_difference('Courier.count') do
      post couriers_url, params: { courier: { email: @courier.email, mobile: @courier.mobile, name: @courier.name, password: @courier.password, station_id: @courier.station_id, status: @courier.status } }, as: :json
    end

    assert_response 201
  end

  test "should show courier" do
    get courier_url(@courier), as: :json
    assert_response :success
  end

  test "should update courier" do
    patch courier_url(@courier), params: { courier: { email: @courier.email, mobile: @courier.mobile, name: @courier.name, password: @courier.password, station_id: @courier.station_id, status: @courier.status } }, as: :json
    assert_response 200
  end

  test "should destroy courier" do
    assert_difference('Courier.count', -1) do
      delete courier_url(@courier), as: :json
    end

    assert_response 204
  end
end
