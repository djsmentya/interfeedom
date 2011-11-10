class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter { |c| Authorization.current_user = c.current_user }

  before_filter :set_locale, :current_cart

  helper_method :current_cart

  protected

  def cart_product_ids
    product_ids =[]
    items = current_cart.items
    items.each do |product_id, q|
      product_ids << product_id
    end
    product_ids
  end

  def after_sign_in_path_for(resource)
    path = $after_sign_in_path || stored_location_for(resource) || super # || welcome_path
    $after_sign_in_path =nil #TODO do not use global variable
    path
  end


  def current_cart
    session[:cart] ||= Cart.new
  end

  def set_locale
    I18n.locale = session[:locale] || params[:locale] || I18n.default_locale
    session[:locale] = nil
  end
end
