# -*- encoding : utf-8 -*-
class OrdersController < ApplicationController
  def index
    @orders_and_products= {}
    orders = current_user.orders.all :include => :order_items
    orders.each do |order|
      @orders_and_products[order] = order.order_items.all :include => :product
    end
    render :layout => 'profile'
  end


  def new
    if user_signed_in?
      @order = Order.new
      product_ids = cart_product_ids
      unless product_ids.nil?
        @products = products_by_ids(product_ids)
      end
    else
      redirect_to :action => :authorization
    end

  end

  def create
    @order = Order.new(params[:order])
    #if cart_product_ids.empty?
      #@order.errors.add(:order_items, 'must be more then 0')
    #else
      @products = products_by_ids(cart_product_ids)

      @products.each do |p|
        @order.total_price += p.price
      end

      @order.user_id = current_user.id
      @order.state = 'in_progress'
      @order.save
      unless @order.errors.present?
        product_items_array = []
        cart_product_ids.each do |product_id|
          product_items_array << {:order_id => @order.id, :product_id => product_id, :quantity => current_cart.item_quantity(product_id)}
        end
        OrderItem.create!(product_items_array)
        session[:cart] = nil
      end
    #end
    if @order.errors.present?
      render :new
    else
      redirect_to @order.paypal_url('ifree.herokuapp.com',payment_notifications_create_path)
    end
  end

  def authorization
    @user = User.new
  end

  def login
    user = User.authenticate(params[:user][:email],
                              params[:user][:password])
    if user.present?
      sign_in :user, user
    end
    redirect_to :action=> :new
  end

  def register #TODO not work yet
    #user = User.authenticate(params[:user][:email], params[:user][:password])
    user = User.find_by_email(params[:user][:email])
    if user.present?
      redirect_to :back, :notice => 'This user already registered'
    else
      user = User.create(params[:user])
      if user.save
        sign_in :user, user
        redirect_to :action=> :new
      else
        redirect_to :back
      end
    end
  end

protected
def products_by_ids(ids)
  @products = Product.find(ids)
end
end
