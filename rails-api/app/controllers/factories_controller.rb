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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory
      @factory = Factory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def factory_params
      params.require(:factory).permit(:name, :mobile, :status, :email, :password, :station_id)
    end
end
