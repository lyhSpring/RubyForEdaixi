require 'test_helper'

class DiscountRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount_rule = discount_rules(:one)
  end

  test "should get index" do
    get discount_rules_url, as: :json
    assert_response :success
  end

  test "should create discount_rule" do
    assert_difference('DiscountRule.count') do
      post discount_rules_url, params: { discount_rule: { added_money: @discount_rule.added_money, base_money: @discount_rule.base_money, end_date: @discount_rule.end_date, from_date: @discount_rule.from_date, type: @discount_rule.type } }, as: :json
    end

    assert_response 201
  end

  test "should show discount_rule" do
    get discount_rule_url(@discount_rule), as: :json
    assert_response :success
  end

  test "should update discount_rule" do
    patch discount_rule_url(@discount_rule), params: { discount_rule: { added_money: @discount_rule.added_money, base_money: @discount_rule.base_money, end_date: @discount_rule.end_date, from_date: @discount_rule.from_date, type: @discount_rule.type } }, as: :json
    assert_response 200
  end

  test "should destroy discount_rule" do
    assert_difference('DiscountRule.count', -1) do
      delete discount_rule_url(@discount_rule), as: :json
    end

    assert_response 204
  end
end
