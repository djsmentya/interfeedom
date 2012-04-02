class WithdrawsController <  ApplicationController
  layout 'profile'
  def index
    @withdraws = Withdraw.where(:user_id => current_user.id)
  end

  def show
    @withdraw = Withdraw.find(params[:id])
  end

  def edit
    @withdraw = Withdraw.find(params[:id])
  end

  def new
    @withdraw = Withdraw.new
  end

  def create
    @withdraw = Withdraw.new(params[:withdraw])
    @withdraw.user = current_user
    @withdraw.state = 'in_progress'
    respond_to do |format|
      if @withdraw.save
        format.html { redirect_to @withdraw, :notice => 'Product was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @withdraw = Withdraw.find(params[:id])
    respond_to do |format|
      if @withdraw.update_attributes(params[:withdraw])
        format.html { redirect_to @withdraw, :notice => 'Request successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @withdraw = Withdraw.find(params[:id])
    @withdraw.destroy
    respond_to do |format|
      format.html { redirect_to withdraws_url }
      format.json { head :ok }
    end
  end
end
