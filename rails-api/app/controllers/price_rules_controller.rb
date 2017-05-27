class PriceRulesController < ApplicationController
  before_action :set_price_rule, only: [:show, :update, :destroy]

  # GET /price_rules
  def index
    @price_rules = PriceRule.all

    render json: @price_rules
  end

  # GET /price_rules/1
  def show
    render json: @price_rule
  end

  # POST /price_rules
  def create
    @price_rule = PriceRule.new(price_rule_params)

    if @price_rule.save
      render json: @price_rule, status: :created, location: @price_rule
    else
      render json: @price_rule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /price_rules/1
  def update
    if PriceRule.where('from_date like ?',"%#{params[:price_rule][:from_date]}%").first
      render json: {error: "time repeat"}.to_json
    else
      if @price_rule.update(price_rule_params)
        render json: @price_rule
      else
        render json: @price_rule.errors, status: :unprocessable_entity
      end     
    end
  end

  def addNewRule
    # @price_rule = PriceRule.where('from_date like ?',"%#{params[:from_date]}%")
    if PriceRule.where('from_date like ?',"%#{params[:price_rule][:from_date]}%").first
      render json: {error: "time repeat"}.to_json
    else
      @price_rule = PriceRule.new(price_rule_params)
      if @price_rule.save
        render json: @price_rule
      else
        render json: @price_rule.errors, status: :unprocessable_entity
      end      
    end
  end

  # DELETE /price_rules/1
  def destroy
    @price_rule.destroy
  end

  def findPriceRule
    @price_rule = PriceRule.order('from_date desc').where('region_id=? and category_id=? and from_date<?',params[:price_rule][:region_id].to_i,params[:price_rule][:category_id].to_i,params[:price_rule][:from_date]).first
    render json: @price_rule
  end

  #根据region_id查找已开通区域的价格规则
  def findByRegionId
    @price_rules = PriceRule.order("updated_at").where('region_id=?',params[:price_rule][:region_id])
    render json: @price_rules
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_rule
      @price_rule = PriceRule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def price_rule_params
      params.require(:price_rule).permit(:grade, :region_id, :category_id, :from_date)
    end
end
