require 'test_helper'

class PriceRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_rule = price_rules(:one)
  end

  test "should get index" do
    get price_rules_url, as: :json
    assert_response :success
  end

  test "should create price_rule" do
    assert_difference('PriceRule.count') do
      post price_rules_url, params: { price_rule: { category_id: @price_rule.category_id, from_date: @price_rule.from_date, grade: @price_rule.grade, region_id: @price_rule.region_id } }, as: :json
    end

    assert_response 201
  end

  test "should show price_rule" do
    get price_rule_url(@price_rule), as: :json
    assert_response :success
  end

  test "should update price_rule" do
    patch price_rule_url(@price_rule), params: { price_rule: { category_id: @price_rule.category_id, from_date: @price_rule.from_date, grade: @price_rule.grade, region_id: @price_rule.region_id } }, as: :json
    assert_response 200
  end

  test "should destroy price_rule" do
    assert_difference('PriceRule.count', -1) do
      delete price_rule_url(@price_rule), as: :json
    end

    assert_response 204
  end
end
