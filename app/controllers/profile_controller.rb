class ProfileController < ApplicationController
  filter_resource_access :collection=> [:info]
  def index
    render :controller => 'profile', :action => :info
  end

  def info
    @profile = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.user = current_user
    respond_to do |format|
      if @profile.save
        current_user = User.find(current_user.id)
        format.html { redirect_to :action => :index, :notice => 'Product was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end

  end

  def edit
    @profile = Profile.new(params[:profile])
  end

end
