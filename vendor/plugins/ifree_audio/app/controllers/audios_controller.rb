class AudiosController < ApplicationController
  layout 'audio'
  def index
    @audios = ProductType.audio.try(:products).page params[:page]
  end
  def show
    @audio = Product.find(params[:id])
  end
end
