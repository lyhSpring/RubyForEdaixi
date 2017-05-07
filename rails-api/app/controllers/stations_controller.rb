class StationsController < ApplicationController
  before_action :set_station, only: [:show, :update, :destroy]

  # GET /stations
  def index
    @stations = Station.all

    render json: @stations
  end

  # GET /stations/1
  def show
    render json: @station
  end

  # POST /stations
  def create
    @station = Station.new(station_params)

    if @station.save
      render json: @station, status: :created, location: @station
    else
      render json: @station.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stations/1
  def update
    if @station.update(station_params)
      render json: @station
    else
      render json: @station.errors, status: :unprocessable_entity
    end
  end

  def getStationByRegion
    @station = Station.find_by_sql ["select stations.id,stations.region_id,stations.name,factories.factory_name from stations,factories,factory_stations where stations.id=factory_stations.station_id and factory_stations.factory_id=factories.id and stations.region_id=?","#{params[:station][:region_id]}"]
    render json: @station
  end

  # DELETE /stations/1
  def destroy
    @station.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def station_params
      params.require(:station).permit(:name, :region_id)
    end
end
