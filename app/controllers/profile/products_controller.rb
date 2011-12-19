class Profile::ProductsController < ApplicationController
  def index
    @products = current_user.products
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def new
    @product =Product.new
  end

  def load_proudct_type
    render :partial => "#{params[:product_type].downcase}"
  end
end
