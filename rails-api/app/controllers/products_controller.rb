class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.paginate(page: params[:page],per_page:10).order(updated_at: :desc)

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      @price = Price.new(:product_id=>@product.id, :price1=>0,:price2=>0,:price3=>0)
      @price.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  def uploadImg
    if request.post?
      
    end    
  end

  #用户端按类别获取产品列表，is_del=0


  #企业端按类别获取产品
  def getProductByCategory
    @product = Product.search(params[:product][:categories_id],params[:page])
    if @product
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end 
  end

  private    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :logo, :is_del, :categories_id)
    end
end
