# -*- encoding : utf-8 -*-
class FilterBox
  def initialize(keys = {})
   unless keys.nil?
    if keys[:product_type].blank?
      @product_type = nil
    else
      @product_type = keys[:product_type]
    end
    
   end
    @date_from = nil
    @date_to = nil
    set_date keys
  end
 
  attr_reader :date_to, :date_from, :product_type
  
  def set_date(date_hash)
    unless date_hash.nil? || date_hash[:date_from].nil? || date_hash[:date_to].nil?
      (@date_from = date_hash[:date_from].to_date) ? !date_hash[:date_from].blank? : @date_from = nil
      (@date_to = date_hash[:date_to].to_date) ? !date_hash[:date_to].blank? : @date_to = nil
    end
  end

  #def from
  #@date_from
  #end

  #def to
  #@date_to
  #end
end

class Profile::ProductsController < ApplicationController
  filter_access_to :all
  layout 'profile'

  def index
    @products = products_list = current_user.products.page(params[:page])
    @filter_box = FilterBox.new params[:filter_box]
    unless @filter_box.date_from.nil? || @filter_box.date_to.nil?
      @products = @products.where('products.updated_at between ? and ?', @filter_box.date_from, @filter_box.date_to)
    else
      @products = @products.where('products.updated_at < ?', @filter_box.date_to) unless @filter_box.date_to.nil?
      @products = @products.where('products.updated_at > ?', @filter_box.date_from) unless @filter_box.date_from.nil?
    end 
    @products = @products.where :product_type => @filter_box.product_type unless @filter_box.product_type.nil?
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
    @product.user = current_user
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
        format.html { redirect_to profile_products_path, :notice => 'Product was successfully updated.' }
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
