class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter { |c| Authorization.current_user = c.current_user }

  before_filter :set_locale

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
