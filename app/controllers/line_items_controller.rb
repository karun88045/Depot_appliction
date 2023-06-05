class LineItemsController < ApplicationController
  include CurrentCart
  skip_before_action :authorize, only: :create
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]


 
  def index
    @line_items = LineItem.all
  end

  
  def show
  end

  
  def new
    @line_item = LineItem.new
  end

  
  def edit
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    if @line_item.save
      redirect_to store_index_url(@line_item)
    end
  end


  def update
    if @line_item.update(line_item_params)
      redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." 
    end
  end

  def destroy
    @line_item.destroy
    redirect_to line_items_url(@line_item), notice: "Line item was successfully destroyed." 
  end

  private
  
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
