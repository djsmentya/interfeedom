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
    @products = products_by_ids(cart_product_ids)
      
    @products.each do |p|
        @order.total_price += p.price
      end

    @order.user_id = current_user.id
    @order.state = 'in_progress'
    @order.save
    cart_product_ids.each do |product_id| #TODO make saving with one request
      @order.order_items.create!(:product_id => product_id, :quantity => current_cart.item_quantity(product_id))
    end
    session[:cart] = nil
    
    if @order.errors.present?
      render :new
    else
      redirect_to root_path, :notice => 'Order in progress'
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
    user = User.authorization(:email =>params[:user][:email], 
                              :password => params[:user][:password])
    if user.present?
      sign_in_and_redirect(user,{:controller => :orders, 
                        :action => :index, :notice => 'Signed in'})   
    end
  end
protected
def products_by_ids(ids)
  @products = Product.find(ids)
end  
end
