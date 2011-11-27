class SearchesController < ApplicationController
  before_filter :search, :only => :index
  def index
    @searches
    @search = params[:search]
    respond_to do |format|
      format.html
    end
  end

  private #TODO Use some engines for search!!!!
  def search(search = params[:search][:value])

    condition = '(name LIKE ? or description LIKE ?)'
    values = ["%#{search}%", "%#{search}%"] 

    unless params[:search][:product_type].blank?
      condition << ' and product_type = ? ' 
      values << params[:search][:product_type]
    end

    unless params[:search][:price_from].blank?
      if params[:search][:price_to].blank? 
        condition << ' and price >= ? ' 
        values << params[:search][:price_from]
      else
        condition << ' and (price between ? AND ?) ' 
        values << params[:search][:price_from]
        values << params[:search][:price_to]
      end
    end

    scope = [condition] + values
    @searches = Product.find(:all,:conditions => scope)
  end
end
