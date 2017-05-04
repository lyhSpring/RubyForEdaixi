class FactoryStationsController < ApplicationController
  before_action :set_factory_station, only: [:show, :update, :destroy]

  # GET /factory_stations
  def index
    @factory_stations = FactoryStation.all

    render json: @factory_stations
  end

  # GET /factory_stations/1
  def show
    render json: @factory_station
  end

  # POST /factory_stations
  def create
    @factory_station = FactoryStation.new(factory_station_params)

    if @factory_station.save
      render json: @factory_station, status: :created, location: @factory_station
    else
      render json: @factory_station.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /factory_stations/1
  def update
    if @factory_station.update(factory_station_params)
      render json: @factory_station
    else
      render json: @factory_station.errors, status: :unprocessable_entity
    end
  end

  # DELETE /factory_stations/1
  def destroy
    @factory_station.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory_station
      @factory_station = FactoryStation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def factory_station_params
      params.require(:factory_station).permit(:factory_id, :station_id)
    end
end
