class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]


  def index
    @products = Product.all.order(:title)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_url(@product), notice: "Product was successfully created." 
    end
  end

  def update
      if @product.update(product_params)
        redirect_to products_url(@product), notice: 'Product was successfully updated.' 
      end
  end

  def destroy
    @product.destroy
    redirect_to products_url(@product), notice: "Product was successfully destroyed." 
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      render :atom
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
end
