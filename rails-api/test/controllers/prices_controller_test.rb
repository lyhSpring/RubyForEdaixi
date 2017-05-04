require 'test_helper'

class PricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price = prices(:one)
  end

  test "should get index" do
    get prices_url, as: :json
    assert_response :success
  end

  test "should create price" do
    assert_difference('Price.count') do
      post prices_url, params: { price: { price1: @price.price1, price2: @price.price2, price3: @price.price3, product_id: @price.product_id } }, as: :json
    end

    assert_response 201
  end

  test "should show price" do
    get price_url(@price), as: :json
    assert_response :success
  end

  test "should update price" do
    patch price_url(@price), params: { price: { price1: @price.price1, price2: @price.price2, price3: @price.price3, product_id: @price.product_id } }, as: :json
    assert_response 200
  end

  test "should destroy price" do
    assert_difference('Price.count', -1) do
      delete price_url(@price), as: :json
    end

    assert_response 204
  end
end
