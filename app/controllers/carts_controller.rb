class CartsController < ApplicationController
  skip_before_action :authorize, only: [:create, :update, :destroy]
  before_action :set_cart, only: [ :show, :edit, :update, :destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
    @carts = Cart.all
  end


  def show
    
  end


  def new
    @cart = Cart.new
  end

  def edit
  end


  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to cart_url(@cart), notice: "Cart was successfully created." 
    end
  end


  def update
      if @cart.update(cart_params)
        redirect_to cart_url(@cart), notice: "Cart was successfully updated." 
      end
  end


  def destroy
    @cart.destroy if @cart.id == session[:cart_id] 
    session[:cart_id] = nil
    redirect_to store_index_url,notice: 'Your cart is currently empty'

  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end


    def cart_params
      params.fetch(:cart, {})
    end

    private

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_index_url, notice: 'Invalid cart'
    end

end
