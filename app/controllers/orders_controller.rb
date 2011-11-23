class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end


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

end
