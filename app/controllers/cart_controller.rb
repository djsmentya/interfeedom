# -*- encoding : utf-8 -*-
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
    redirect_to :back, :notice => I18n.t('cart.index.added_to_cart'), :locals=>{:params => params}
  end

  def quantity
    params[:cart_items].each do |id, quantity|
      current_cart.items[id.to_i] = quantity.to_i
    end
    redirect_to :back
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
