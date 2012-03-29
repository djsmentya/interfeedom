# -*- encoding : utf-8 -*-
class LocalesController < ApplicationController

  def change_locale
    session[:locale] = params[:locale]
    redirect_to :back, :locals => {:params => params}
  end

end
