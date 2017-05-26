class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :update, :destroy]

  # GET /regions
  def index
    @regions = Region.all

    render json: @regions
  end

  # GET /regions/1
  def show
    render json: @region
  end

  # POST /regions
  def create
    @region = Region.new(region_params)

    if @region.save
      render json: @region, status: :created, location: @region
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /regions/1
  def update
    if @region.update(region_params)
      render json: @region
    else
      render json: @region.errors, status: :unprocessable_entity
    end
  end

  # DELETE /regions/1
  def destroy
    @region.destroy
  end

  def getRegionId
    @region = Region.where('name = ?',"#{params[:region][:name]}")
    render json: @region
  end

  #status=0 未开通
  #status=1 已开通
  #开通一个区域
  def openRegion
    @region = Region.find(params[:region][:id])
    @region.status = 1
    @region.save
    Category.find_each do |category|
      @price_rule = PriceRule.new
      @price_rule.grade = 1
      @price_rule.region_id = params[:region][:id]
      @price_rule.category_id = category.id
      @price_rule.from_date = Time.now.strftime('%Y-%m-%d %H:%M:%S')
      @price_rule.save
    end
    render json: @region
  end
  
  #关闭一个区域
  def closeRegion
    @region = Region.find(params[:region][:id])
    @region.status = 0
    @region.save    
    PriceRule.delete_all(["region_id=?",@region.id])
    render json: @region
  end

  #用户端获取所有已经开通的区域
  def getRegionsStatus1
    @regions = Region.order("updated_at").where('status=1')
    render json: @regions
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def region_params
      params.require(:region).permit(:name, :status)
    end
end
