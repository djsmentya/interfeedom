# -*- encoding : utf-8 -*-
class AudiosController < ApplicationController
  layout 'audio'
  def index
    @audios = Product.try(:where,:product_type => :audio.to_s.capitalize  ).try(:page, params[:page] )
  end

  def show
    @audio = Product.find(params[:id])
  end
end
