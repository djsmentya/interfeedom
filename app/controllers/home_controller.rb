class HomeController < ApplicationController
  filter_resource_access

  def index
    @last_added_products =  Product.all(:order =>'created_at DESC',:limit=>3)
  end
end
