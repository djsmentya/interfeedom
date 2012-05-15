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
      if valid_integer?(params[:search][:price_to]) && valid_integer?(params[:search][:price_from])
        unless  params[:search][:price_to].blank? && params[:search][:price_from].blank?
          if  params[:search][:price_to].blank?
            condition << ' and price >= ? '
            values << params[:search][:price_from]
          elsif params[:search][:price_from].blank?
            condition << ' and price <= ? '
            values << params[:search][:price_to]
          else
            condition << ' and (price between ? AND ?) '
            values << params[:search][:price_from]
            values << params[:search][:price_to]
          end
        end
      else
        params[:search][:price_from] = nil
        params[:search][:price_to] = nil
      end
      scope = [condition.sub('and', '')] + values

      product_translations =  ProductTranslation.all(:select => :product_id ,
                                                     :conditions => condition_t + values_t).collect{|translation| translation.product_id}
      @searches = Product.where('id in (?)', product_translations.uniq)
      @searches = @searches.where(scope).page(params[:page])
    end
  end

  def valid_integer?(value)
    converted = value.to_i.to_s
    converted.eql?(value)
  end
end
