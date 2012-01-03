class Profile::ProductsController < ApplicationController
  filter_access_to :all
  layout 'profile'
  def index
    @products = current_user.products
  end

  def show
    @product  = current_user.products.find_by_id(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def new
    @product =Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      Target.create(:user_id => current_user.id, :product_id => @product.id)
      redirect_to profile_products_path, :notice => 'Product was successfuly created.'
    else 
      render :action => :edit
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def load_product_type
    render :partial => "#{params[:product_type].downcase}", 
           :locals => {:product => Product.new, :locale => params[:locale]}
  end
end
