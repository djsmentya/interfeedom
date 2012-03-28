class Profile::OrdersController < ApplicationController
  layout 'profile'
  # GET /profile/orders
  # GET /profile/orders.json
  def index
    orders_arr ||=  Order.includes(:order_items).where('order_items.product_id in (?)',current_user.product_ids ).page(params[:page])
    if params[:search].blank?
      @orders = orders_arr
    else
      @orders = orders_arr.where('recipient LIKE ?', "#{params[:search]}%")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @profile_orders }
    end
  end


  # GET /profile/orders/1
  # GET /profile/orders/1.json
  def show
    @order = Order.includes(:order_items).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @profile_order }
    end
  end


  # GET /profile/orders/1/edit
  def edit
    @profile_order = Profile::Order.find(params[:id])
  end

  # POST /profile/orders
  # POST /profile/orders.json
  def create
    @profile_order = Profile::Order.new(params[:profile_order])

    respond_to do |format|
      if @profile_order.save
        format.html { redirect_to @profile_order, :notice => 'Order was successfully created.' }
        format.json { render :json => @profile_order, :status => :created, :location => @profile_order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @profile_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile/orders/1
  # PUT /profile/orders/1.json
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update_attributes(:state => 'completed')
        format.html { redirect_to profile_orders_path, :notice => 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @profile_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/orders/1
  # DELETE /profile/orders/1.json
  def destroy
    @profile_order = Profile::Order.find(params[:id])
    @profile_order.destroy

    respond_to do |format|
      format.html { redirect_to profile_orders_url }
      format.json { head :ok }
    end
  end
end
