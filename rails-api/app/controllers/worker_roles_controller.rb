class WorkerRolesController < ApplicationController
  before_action :set_worker_role, only: [:show, :update, :destroy]

  # GET /worker_roles
  def index
    @worker_roles = WorkerRole.all

    render json: @worker_roles
  end

  # GET /worker_roles/1
  def show
    render json: @worker_role
  end

  # POST /worker_roles
  def create
    @worker_role = WorkerRole.new(worker_role_params)

    if @worker_role.save
      render json: @worker_role, status: :created, location: @worker_role
    else
      render json: @worker_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /worker_roles/1
  def update
    if @worker_role.update(worker_role_params)
      render json: @worker_role
    else
      render json: @worker_role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /worker_roles/1
  def destroy
    @worker_role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker_role
      @worker_role = WorkerRole.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def worker_role_params
      params.require(:worker_role).permit(:role_id, :worker_id)
    end
end
