class CartController < ApplicationController
  before_filter :find_cart

  def index
    product_ids = cart_product_ids
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

  def destroy
    @cart.items.delete(params[:id].to_i)
    if request.xhr?
       render :text => :deletet, :notice=>'Deleted'
    else
      redirect_to :controller => :cart, :action => :index
    end
  end

  private
  def find_cart
    @cart = current_cart
  end

end
