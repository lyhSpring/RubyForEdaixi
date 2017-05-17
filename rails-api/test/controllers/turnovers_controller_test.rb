require 'test_helper'

class TurnoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turnover = turnovers(:one)
  end

  test "should get index" do
    get turnovers_url, as: :json
    assert_response :success
  end

  test "should create turnover" do
    assert_difference('Turnover.count') do
      post turnovers_url, params: { turnover: { card_id: @turnover.card_id, fake_money: @turnover.fake_money, true_money: @turnover.true_money, type: @turnover.type } }, as: :json
    end

    assert_response 201
  end

  test "should show turnover" do
    get turnover_url(@turnover), as: :json
    assert_response :success
  end

  test "should update turnover" do
    patch turnover_url(@turnover), params: { turnover: { card_id: @turnover.card_id, fake_money: @turnover.fake_money, true_money: @turnover.true_money, type: @turnover.type } }, as: :json
    assert_response 200
  end

  test "should destroy turnover" do
    assert_difference('Turnover.count', -1) do
      delete turnover_url(@turnover), as: :json
    end

    assert_response 204
  end
end
