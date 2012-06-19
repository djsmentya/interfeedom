# -*- encoding : utf-8 -*-
class SupportsController < ApplicationController
  def index

  end

  def new
    @support = Support.new
  end

  def create
    support = Support.new(params[:support])
    if support.save
      redirect_to root_path, :notice => t('.will_read'), :locales =>{:locale => params[:locale] }
    end
  end
end

