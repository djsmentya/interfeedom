class UsersController < ApplicationController
  def rate
    @user = User.find(params[:id])
    @user.rate(params[:stars], current_user)
    average = @user.rate_average(true)
    width = (average / @user.class.max_stars.to_f) * 100
    render :json => {:id => @user.wrapper_dom_id(params), :average => average, :width => width}
  end
end
