class WaybillsController < ApplicationController
  before_action :set_waybill, only: [:show, :update, :destroy]

  # GET /waybills
  def index
    @waybills = Waybill.all

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waybill
      @waybill = Waybill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def waybill_params
      params.require(:waybill).permit(:sender_type, :sender_id, :status, :recieve_id, :exp_time, :actual_time, :waybill_id, :order_id)
    end
end
