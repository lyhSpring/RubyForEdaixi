class WaybillsController < ApplicationController
  before_action :set_waybill, only: [:show, :update, :destroy]

  # GET /waybills
  def index
    @waybills = Waybill.paginate(page: params[:page],per_page:10).order(updated_at: :desc)

    render json: @waybills
  end

  # GET /waybills/1
  def show
    render json: @waybill
  end

  # POST /waybills
  def create
    @waybill = Waybill.new(waybill_params)

    if @waybill.save
      render json: @waybill, status: :created, location: @waybill
    else
      render json: @waybill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /waybills/1
  def update
    if @waybill.update(waybill_params)
      render json: @waybill
    else
      render json: @waybill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /waybills/1
  def destroy
    @waybill.destroy
  end

# 根据取送人员的id查看其全部物流单
  def getWaybillsByCourierId
    @waybills = Waybill.order("updated_at desc").where('recieve_id=? and recieve_type=2',params[:waybill][:recieve_id])
    render json: @waybills
  end

  #根据运单的状态和order_id查找
  def getWaybillByStatus
   @waybill = Waybill.find_by_order_id_and_recieve_type(params[:waybill][:order_id].to_i,params[:waybill][:recieve_type])
  # @waybill = Waybill.find_by_status_and_order_id(params[:waybill][:status].to_i,params[:waybill][:order_id].to_i)
    if @waybill
      render json: @waybill
    else
      render json: @waybill.errors, status: :unprocessable_entity
    end
  end

# 根据order_id和waybill的status获取订单
  def getWaybillByStatusAndId
    @waybill = Waybill.find_by_order_id_and_status_and_recieve_type(params[:waybill][:order_id],params[:waybill][:status],params[:waybill][:recieve_type])
    if @waybill
      render json: @waybill
    else
      render json: @waybill.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waybill
      @waybill = Waybill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def waybill_params
      params.require(:waybill).permit(:sender_type, :sender_id, :status, :recieve_id, :exp_time, :actual_time, :waybill_id, :order_id, :recieve_type)
    end
end
