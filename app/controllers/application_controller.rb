class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter { |c| Authorization.current_user = c.current_user }

  before_filter :set_locale, :current_cart

  helper_method :current_cart

  protected

  def current_cart
    session[:cart] ||= Cart.new
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
