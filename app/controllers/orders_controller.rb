class OrdersController < ApplicationController
  def new
    if user_signed_in?
      @order = Order.new
      product_ids = cart_product_ids
      unless product_ids.nil?
        @products = Product.find(product_ids)
      end
    else
      redirect_to :action => :authorization
    end

  end

  def create
    @order = Order.new(params[:order])
    @order.user_id = current_user.id
    @order.save
    cart_product_ids do |product_id|
      @order.order_items.create(:product_id => product_id, :quantity => current_cart[product_id])
    end
    session[:cart] = nil
                               # idi nahui
    if @order.errors.present?
      render :new
    else
      redirect_to root_path, :notice => 'Order in progress'
    end
  end

  def authorization
    $after_sign_in_path = new_order_path #TODO do not use global variable see application_controller
  end

end
