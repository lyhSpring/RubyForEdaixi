class UsersController < ApplicationController
  require 'will_paginate'

  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.paginate(page: params[:page],per_page:10).order(updated_at: :desc)

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    @user = User.find_by_mobile_and_password(params[:user][:mobile],params[:user][:password])
    if @user
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end    
  end

  def register
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def getUsersByRole
    @user = User.where('role = ?',"#{params[:user][:role]}");
    if @user
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def updateStationId
    if @users.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :password, :email, :mobile, :station_id)
    end
end
