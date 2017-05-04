require 'test_helper'

class WaybillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @waybill = waybills(:one)
  end

  test "should get index" do
    get waybills_url, as: :json
    assert_response :success
  end

  test "should create waybill" do
    assert_difference('Waybill.count') do
      post waybills_url, params: { waybill: { actual_time: @waybill.actual_time, exp_time: @waybill.exp_time, order_id: @waybill.order_id, recieve_id: @waybill.recieve_id, sender_id: @waybill.sender_id, sender_type: @waybill.sender_type, status: @waybill.status, waybill_id: @waybill.waybill_id } }, as: :json
    end

    assert_response 201
  end

  test "should show waybill" do
    get waybill_url(@waybill), as: :json
    assert_response :success
  end

  test "should update waybill" do
    patch waybill_url(@waybill), params: { waybill: { actual_time: @waybill.actual_time, exp_time: @waybill.exp_time, order_id: @waybill.order_id, recieve_id: @waybill.recieve_id, sender_id: @waybill.sender_id, sender_type: @waybill.sender_type, status: @waybill.status, waybill_id: @waybill.waybill_id } }, as: :json
    assert_response 200
  end

  test "should destroy waybill" do
    assert_difference('Waybill.count', -1) do
      delete waybill_url(@waybill), as: :json
    end

    assert_response 204
  end
end
