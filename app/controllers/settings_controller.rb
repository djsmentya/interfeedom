class SettingsController < ApplicationController
  def create
    Setting.preferences= params[:setting]
    redirect_to :back, :notice => 'visited'
  end
end
