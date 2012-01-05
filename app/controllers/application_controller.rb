class ApplicationController < ActionController::Base
  protect_from_forgery
    require 'active_admin_views_pages_base.rb'
    require 'active_admin_views_header_render.rb'
  before_filter { |c| Authorization.current_user = c.current_user }

  before_filter :set_locale, :current_cart

  helper_method :current_cart, :cart_products

  protected

  def cart_product_ids
    product_ids =[]
    items = current_cart.items
    items.each do |product_id, q|
      product_ids << product_id
    end
    product_ids
  end
  def cart_products
    @cart_products ||= Product.find(cart_product_ids)
  end

  def current_cart
    session[:cart] ||= Cart.new
  end

  def set_locale
    I18n.locale = session[:locale] || params[:locale] || I18n.default_locale
    session[:locale] = nil
  end
end
