class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  #根据订单id获取订单的详细信息
  def getOrdersAllInfo
    @order = Order.find(params[:order][:id])
    @order.waybills = Waybill.where('order_id=?',@order.id)
    @order.items = Item.where('order_id=?',@order.id)
    render json: @order
  end

  #根据用户id获取订单简略信息
  def getOrdersByUserId
    @order = Order.where('user_id = ?',"#{params[:order][:user_id]}")
    render json: @order
  end

  #快递员获取可抢订单
  def getOrdersByStatus
    @orders = Order.where('status=1 or status=6')
    if @orders
      render json: @orders
    else
      render json: @orders.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:courier_id, :washing_status, :factory_id, :waybill_id, :voucher_status, :categories_id, :status, :address_id, :totalprice, :user_id, :act_pay)
    end
end
