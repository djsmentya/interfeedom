class HomeController < ApplicationController
  filter_resource_access

  def index
    @last_added_products =  Product.all(:order =>'created_at DESC',:limit=>3)
    #respond_to do |format|
      #format.html # info.html.haml
      #format.json { render :json => @products }
    #end

  end
end
