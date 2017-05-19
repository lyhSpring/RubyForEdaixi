class SettlementsController < ApplicationController
  before_action :set_settlement, only: [:show, :update, :destroy]

  # GET /settlements
  def index
    @settlements = Settlement.all

    render json: @settlements
  end

  # GET /settlements/1
  def show
    render json: @settlement
  end

  # POST /settlements
  def create
    @settlement = Settlement.new(settlement_params)

    if @settlement.save
      render json: @settlement, status: :created, location: @settlement
    else
      render json: @settlement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /settlements/1
  def update
    if @settlement.update(settlement_params)
      render json: @settlement
    else
      render json: @settlement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /settlements/1
  def destroy
    @settlement.destroy
  end

  #计量
  def meter
    @settlement = Settlement.find_by_courier_id(params[:settlement][:courier_id])
    @settlement.unsettled += 1
    @settlement.money_unsettled += 1
    if @settlement.save
      render json: @settlement
    else
      render json: @settlement.errors, status: :unprocessable_entity
    end
  end

  #计价 结算
  def valuate
    @settlement = Settlement.find_by_courier_id(params[:settlement][:courier_id])
    @settlement.settled = @settlement.settled + @settlement.unsettled
    @settlement.unsettled = 0
    @settlement.money_settled = @settlement.money_settled + @settlement.money_unsettled
    @settlement.money_unsettled = 0
    if @settlement.save
      render json: @settlement
    else
      render json: @settlement.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_settlement
      @settlement = Settlement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def settlement_params
      params.require(:settlement).permit(:settled, :unsettled, :money_settled, :money_unsettled, :courier_id)
    end
end
