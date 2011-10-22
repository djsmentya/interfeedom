class HomeController < ApplicationController
  filter_resource_access

  def index
  end

  def change_locale
    I18n.locale = params[]#TODO add params
  end
end
