require 'test_helper'

class SettlementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @settlement = settlements(:one)
  end

  test "should get index" do
    get settlements_url, as: :json
    assert_response :success
  end

  test "should create settlement" do
    assert_difference('Settlement.count') do
      post settlements_url, params: { settlement: { courier_id: @settlement.courier_id, money_settled: @settlement.money_settled, money_unsettled: @settlement.money_unsettled, settled: @settlement.settled, unsettled: @settlement.unsettled } }, as: :json
    end

    assert_response 201
  end

  test "should show settlement" do
    get settlement_url(@settlement), as: :json
    assert_response :success
  end

  test "should update settlement" do
    patch settlement_url(@settlement), params: { settlement: { courier_id: @settlement.courier_id, money_settled: @settlement.money_settled, money_unsettled: @settlement.money_unsettled, settled: @settlement.settled, unsettled: @settlement.unsettled } }, as: :json
    assert_response 200
  end

  test "should destroy settlement" do
    assert_difference('Settlement.count', -1) do
      delete settlement_url(@settlement), as: :json
    end

    assert_response 204
  end
end
