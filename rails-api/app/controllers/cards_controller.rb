class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  # GET /cards
  def index
    @cards = Card.all

    render json: @cards
  end

  # GET /cards/1
  def show
    render json: @card
  end

  # POST /cards
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  #系统充值
  def systemRecharge
    @card = Card.find(params[:card][:id])
    @card.fake_money = @card.fake_money + params[:card][:fake_money].to_i
    if @card.save
      @turnover = Turnover.new
      @turnover.card_id = params[:card][:id].to_i
      @turnover.turnover_type = 1      
      @turnover.fake_money = params[:card][:fake_money].to_i
      @turnover.save
      render json: {status: "success"}.to_json
    else
      render json: {status: "refused"}.to_json
    end
  end

  #用户充值
  def userRecharge
    @card = Card.find(params[:card][:id])
    @card.true_money = @card.true_money + params[:card][:true_money].to_i
    @card.fake_money = @card.fake_money + params[:card][:fake_money].to_i
    if @card.save
      @turnover = Turnover.new
      @turnover.card_id = params[:card][:id].to_i
      @turnover.turnover_type = 2
      @turnover.true_money = params[:card][:true_money].to_i
      @turnover.fake_money = params[:card][:fake_money].to_i
      @turnover.save
      render json: {status: "success"}.to_json
    else
      render json: {status: "refused"}.to_json
    end
  end

  #用户消费
  def spend
    @card = Card.find(params[:card][:id])
    @total = params[:card][:true_money].to_i+params[:card][:fake_money].to_i
    # @card.true_money = @card.true_money - params[:card][:true_money].to_i
    # @card.fake_money = @card.fake_money - params[:card][:fake_money].to_i
    if (@card.true_money+@card.fake_money-params[:card][:true_money].to_i-params[:card][:fake_money].to_i)<0
      render json: {status: "refused"}.to_json
    else
      if @card.true_money>=@total
        @card.true_money = @card.true_money - @total
        @turnover = Turnover.new
        @turnover.card_id = params[:card][:id].to_i
        @turnover.turnover_type = 0
        @turnover.true_money = @total
        @turnover.fake_money = 0
        @turnover.save
      else
        @card.fake_money = @card.fake_money - @total + @card.true_money        
        @turnover = Turnover.new
        @turnover.card_id = params[:card][:id].to_i
        @turnover.turnover_type = 0
        @turnover.true_money = @card.true_money
        @turnover.fake_money = @total - @card.true_money
        @turnover.save
        @card.true_money = 0
      end
      @card.save
      render json: {status: "success"}.to_json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:user_id, :true_money, :fake_money)
    end
end
