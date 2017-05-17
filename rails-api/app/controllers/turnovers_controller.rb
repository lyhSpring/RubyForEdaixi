class TurnoversController < ApplicationController
  before_action :set_turnover, only: [:show, :update, :destroy]

  # GET /turnovers
  def index
    @turnovers = Turnover.paginate(page: params[:page],per_page:10).order(created_at: :desc)

    render json: @turnovers
  end

  # GET /turnovers/1
  def show
    render json: @turnover
  end

  # POST /turnovers
  def create
    @turnover = Turnover.new(turnover_params)

    if @turnover.save
      render json: @turnover, status: :created, location: @turnover
    else
      render json: @turnover.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /turnovers/1
  def update
    if @turnover.update(turnover_params)
      render json: @turnover
    else
      render json: @turnover.errors, status: :unprocessable_entity
    end
  end

  # DELETE /turnovers/1
  def destroy
    @turnover.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turnover
      @turnover = Turnover.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def turnover_params
      params.require(:turnover).permit(:turnover_type, :true_money, :fake_money, :card_id)
    end
end
