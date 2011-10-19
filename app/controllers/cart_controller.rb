class CartController < ApplicationController
  before_filter :find_cart

  def index
    product_ids =[]
    items = @cart.items
    items.each do |product_id|
      product_ids << product_id
    end
    unless product_ids.nil?
      @products = Product.find(product_ids)
    else
      render :nothing => 'No Items'
    end
  end

  def add_item
    @cart << params[:product_id].to_i
    redirect_to :back, :notice => 'Added to cart'
  end

  private
  def find_cart
    @cart = current_cart
  end

end
