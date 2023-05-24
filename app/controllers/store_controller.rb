class StoreController < ApplicationController
  skip_before_action :authorize
  def index
    @products = Product.order(:title)
    # if session[:counter].nil?
    # # Counter has not been initialized, set it to 1
    # session[:counter] = 1
    # else
    # # Counter exists, increment it
    # session[:counter] += 1
    # end
  end

  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
     session[:counter] += 1
  end
end
