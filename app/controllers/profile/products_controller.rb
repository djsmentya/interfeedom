class FilterDate
  @date_from = nil
  @date_to = nil

  def set_date(date_hash)
    unless date_hash.nil?
      (@date_from = date_hash[:from].to_date) ? !date_hash[:from].blank? : @date_from = nil
      (@date_to = date_hash[:to].to_date) ? !date_hash[:to].blank? : @date_to = nil
    end
  end

  def from
    @date_from
  end

  def to
    @date_to
  end
end

class Profile::ProductsController < ApplicationController
  filter_access_to :all
  layout 'profile'


  def index
   @products = products_list = current_user.products.page(params[:page])
    @updated_at = FilterDate.new
    @updated_at.set_date params[:updated_at]
      unless @updated_at.from.nil? || @updated_at.to.nil?
        @products = products_list.where('products.updated_at between ? and ?', @updated_at.from, @updated_at.to)
      else
        @products = products_list.where('products.updated_at < ?', @updated_at.to) unless @updated_at.to.nil?
        @products = products_list.where('products.updated_at > ?', @updated_at.from) unless @updated_at.from.nil?
      end 
    @products
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
