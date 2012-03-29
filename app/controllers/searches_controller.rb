# -*- encoding : utf-8 -*-
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
  def search()
    condition = ''
    values = []
    unless params[:search].nil?
      search_param = params[:search][:value]
      condition_t = ['name LIKE ? or description LIKE ?']
      values_t = ["%#{search_param}%", "%#{search_param}%"]

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

      scope = [condition.sub('and', '')] + values

      product_translations =  ProductTranslation.all(:select => :product_id ,:conditions => condition_t + values_t).collect{|translation| translation.product_id}
      @searches = Product.where('id in (?)', product_translations.uniq)
      @searches = @searches.where(scope).page(params[:page])
    end
  end
end
