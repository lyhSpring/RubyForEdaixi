require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url, as: :json
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address_id: @order.address_id, categories_id: @order.categories_id, courier_id: @order.courier_id, factory_id: @order.factory_id, status: @order.status, totalprice: @order.totalprice, user_id: @order.user_id, voucher_status: @order.voucher_status, washing_status: @order.washing_status, waybill_id: @order.waybill_id } }, as: :json
    end

    assert_response 201
  end

  test "should show order" do
    get order_url(@order), as: :json
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address_id: @order.address_id, categories_id: @order.categories_id, courier_id: @order.courier_id, factory_id: @order.factory_id, status: @order.status, totalprice: @order.totalprice, user_id: @order.user_id, voucher_status: @order.voucher_status, washing_status: @order.washing_status, waybill_id: @order.waybill_id } }, as: :json
    assert_response 200
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order), as: :json
    end

    assert_response 204
  end
end
