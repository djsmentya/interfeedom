class SearchesController < ApplicationController
before_filter :search, :only => :index
  def index
    @searches
    @search = params[:search][:value]
    respond_to do |format|
      format.html
    end
  end

private #TODO Use some engines for search!!!!
  def search(search = params[:search][:value])
    unless search.blank?
     @searches = Product.find(:all,:conditions => ['name LIKE ? or description LIKE ?',"%#{search}%", "%#{search}%"])
    else
      @searches = Product.all
    end
  end
end
