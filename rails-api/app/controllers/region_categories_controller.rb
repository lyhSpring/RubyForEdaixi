class RegionCategoriesController < ApplicationController
  before_action :set_region_category, only: [:show, :update, :destroy]

  # GET /region_categories
  def index
    @region_categories = RegionCategory.all

    render json: @region_categories
  end

  # GET /region_categories/1
  def show
    render json: @region_category
  end

  # POST /region_categories
  def create
    @region_category = RegionCategory.new(region_category_params)

    if @region_category.save
      render json: @region_category, status: :created, location: @region_category
    else
      render json: @region_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /region_categories/1
  def update
    if @region_category.update(region_category_params)
      render json: @region_category
    else
      render json: @region_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /region_categories/1
  def destroy
    @region_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region_category
      @region_category = RegionCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def region_category_params
      params.require(:region_category).permit(:region_id, :category_id)
    end
end
