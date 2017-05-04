require 'test_helper'

class RegionCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @region_category = region_categories(:one)
  end

  test "should get index" do
    get region_categories_url, as: :json
    assert_response :success
  end

  test "should create region_category" do
    assert_difference('RegionCategory.count') do
      post region_categories_url, params: { region_category: { category_id: @region_category.category_id, region_id: @region_category.region_id } }, as: :json
    end

    assert_response 201
  end

  test "should show region_category" do
    get region_category_url(@region_category), as: :json
    assert_response :success
  end

  test "should update region_category" do
    patch region_category_url(@region_category), params: { region_category: { category_id: @region_category.category_id, region_id: @region_category.region_id } }, as: :json
    assert_response 200
  end

  test "should destroy region_category" do
    assert_difference('RegionCategory.count', -1) do
      delete region_category_url(@region_category), as: :json
    end

    assert_response 204
  end
end
