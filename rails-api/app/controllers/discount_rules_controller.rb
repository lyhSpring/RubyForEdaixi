class DiscountRulesController < ApplicationController
  before_action :set_discount_rule, only: [:show, :update, :destroy]

  # GET /discount_rules
  def index
    @discount_rules = DiscountRule.all

    render json: @discount_rules
  end

  # GET /discount_rules/1
  def show
    render json: @discount_rule
  end

  # POST /discount_rules
  def create
    @discount_rule = DiscountRule.new(discount_rule_params)

    if @discount_rule.save
      render json: @discount_rule, status: :created, location: @discount_rule
    else
      render json: @discount_rule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /discount_rules/1
  def update
    if @discount_rule.update(discount_rule_params)
      render json: @discount_rule
    else
      render json: @discount_rule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /discount_rules/1
  def destroy
    @discount_rule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount_rule
      @discount_rule = DiscountRule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def discount_rule_params
      params.require(:discount_rule).permit(:type, :base_money, :added_money, :from_date, :end_date)
    end
end