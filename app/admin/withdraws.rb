ActiveAdmin.register Withdraw do
  index do
    column :id
    column :user
    column :amount
    column :payment_type
    column :state do |withdraw|
      status_tag withdraw.state
    end
    column :created_at
    column :actions do |withdraw|
      link = link_to( I18n.t(:destroy ), admin_withdraw_path(withdraw), :method=> :delete)+ " "
      if withdraw.state == 'in_progress'
      link << link_to('Payed', pay_admin_withdraw_path(withdraw) )
      end
      link
    end
  end

  member_action :pay do
    withdraw = Withdraw.find(params[:id])
    withdraw.state = 'completed'
    withdraw.user.money = (withdraw.user.money - withdraw.amount)
    if    withdraw.save and withdraw.user.save
      redirect_to :action => :index, :notice => 'Completed'
    else
      redirect_to :action => :index, :notice => "Problems"
    end
  end
end

