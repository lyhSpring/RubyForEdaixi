class FactoriesController < ApplicationController
  before_action :set_factory, only: [:show, :update, :destroy]

  # GET /factories
  def index
    @factories = Factory.all

    render json: @factories
  end

  # GET /factories/1
  def show
    render json: @factory
  end

  # POST /factories
  def create
    @factory = Factory.new(factory_params)

    if @factory.save
      render json: @factory, status: :created, location: @factory
    else
      render json: @factory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /factories/1
  def update
    if @factory.update(factory_params)
      render json: @factory
    else
      render json: @factory.errors, status: :unprocessable_entity
    end
  end

  def getAllFactories
    @factory = Factory.find_by_sql ["select * from factories,addresses where addresses.addressable_id=factories.id and addresses.addressable_type=3"]
    render json: @factory
  end

  # DELETE /factories/1
  def destroy
    @factory.destroy
  end

  #加工商登录
  def login
    @factory = Factory.find_by_sql ["select * from factories,addresses where factories.mobile=? and factories.password=? and addresses.addressable_id=factories.id and addresses.addressable_type=3", "#{params[:factory][:mobile]}","#{params[:factory][:password]}"]
    if @factory
      render json: @factory
    else
      render json: @factory.errors, status: :unprocessable_entity
    end
  end

  #根据station_id查询station所属的工厂
  def getFactoryByStation
    @factories = Factory.find_by_sql ["select * from factories,factories_stations where factories.station_id = factories_stations.station_id and factories.id = factories_stations.factory_id and factories.station_id=?","#{params[:factory][:station_id].to_i}"]
    render json: @factories
  end

  #根据region_id查询factory
  def getFactoryByRegion
    @factory = Factory.find_by_region_id(params[:factory][:region_id])
    if @factory
      render json: @factory
    else
      render json: {stauts: "errors"}.to_json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory
      @factory = Factory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def factory_params
      params.require(:factory).permit(:name, :mobile, :status, :email, :password, :station_id, :factory_name)
    end
end
