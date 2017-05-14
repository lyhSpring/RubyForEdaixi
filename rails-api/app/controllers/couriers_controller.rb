class CouriersController < ApplicationController
  before_action :set_courier, only: [:show, :update, :destroy]

  # GET /couriers
  def index
    @couriers = Courier.paginate(page: params[:page],per_page:10).order(updated_at: :desc)

    render json: @couriers
  end

  # GET /couriers/1
  def show
    render json: @courier
  end

  # POST /couriers
  def create
    @courier = Courier.new(courier_params)

    if @courier.save
      render json: @courier, status: :created, location: @courier
    else
      render json: @courier.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /couriers/1
  def update
    if @courier.update(courier_params)
      render json: @courier
    else
      render json: @courier.errors, status: :unprocessable_entity
    end
  end

  # DELETE /couriers/1
  def destroy
    @courier.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier
      @courier = Courier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def courier_params
      params.require(:courier).permit(:name, :status, :email, :mobile, :password, :station_id)
    end
end
