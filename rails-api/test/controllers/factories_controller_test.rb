require 'test_helper'

class FactoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factory = factories(:one)
  end

  test "should get index" do
    get factories_url, as: :json
    assert_response :success
  end

  test "should create factory" do
    assert_difference('Factory.count') do
      post factories_url, params: { factory: { email: @factory.email, mobile: @factory.mobile, name: @factory.name, password: @factory.password, station_id: @factory.station_id, status: @factory.status } }, as: :json
    end

    assert_response 201
  end

  test "should show factory" do
    get factory_url(@factory), as: :json
    assert_response :success
  end

  test "should update factory" do
    patch factory_url(@factory), params: { factory: { email: @factory.email, mobile: @factory.mobile, name: @factory.name, password: @factory.password, station_id: @factory.station_id, status: @factory.status } }, as: :json
    assert_response 200
  end

  test "should destroy factory" do
    assert_difference('Factory.count', -1) do
      delete factory_url(@factory), as: :json
    end

    assert_response 204
  end
end
