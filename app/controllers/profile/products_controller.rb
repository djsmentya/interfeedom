class Profile::ProductsController < ApplicationController
  filter_access_to :all
  layout 'profile'
  def index
    @products = current_user.products
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def new
    @product =Product.new
  end

  def create
    current_user.products.create(params[:product])
  end

  def load_proudct_type
    render :partial => "#{params[:product_type].downcase}"
  end
end
