# -*- encoding : utf-8 -*-
ActiveAdmin.register Order do
  filter :recipient
  filter :phone
  filter :email
  filter :created_at

  actions :index, :show, :destroy, :pay

  index  do
    column :id
    column :state do |order|
      if order.payment_state.eql?('payed')
        title = I18n.t(:payed)
        state = :green
      else
        title = I18n.t(:not_payed)
        state = :red
      end
      div(
        status_tag(I18n.t order.state.to_sym) + status_tag(title, state), :style =>'padding-left:5px;')
    end

    column :recipient
    column :phone

    column '' do |resource|
      links = link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links += link_to I18n.t(:pay), pay_admin_order_path(resource), :class => "member_link pay_link"

      links
    end
  end

  show do
    panel Order.model_name.human do
      table_for(order.order_items) do |t|
        t.column(I18n.t('cart.index.product')) {|item| auto_link item.product                }
        t.column(I18n.t('cart.index.quantity')){|item| item.quantity}
        t.column(I18n.t(:price)) {|item| item.product.price}
        tr  do
          td ''
          td I18n.t('shared.cart_widget.total'), :style => "text-align: right;"
          td number_to_currency(order.total_price)
        end
      end
    end
    active_admin_comments
  end

  sidebar I18n.t('active_admin.order.sidebar.customer_info'), :only => :show do
    attributes_table_for order.user do
      if order.user.profile
      row("User") { link_to  order.user.try(:profile).try(:full_name), admin_user_path(order.user) }
      else

      row("User") { link_to  "User" , admin_user_path(order.user) }
      end
      row :email
    end
  end

  member_action :pay do
    order  = Order.find(params[:id])
    order.order_items.each do |item|
      pr = item.product
      us = pr.user
      pr.count_on_hand -= item.quantity
      us.money += item.product.price * item.quantity
      us.save
      pr.save
    end
    order.transaction_id = 'AdminUser:' + current_admin_user.id.to_s
    order.state = 'completed'
    order.payment_state = 'payed'
    order.save
    redirect_to admin_orders_path, :notice => 'Order processed successfully!'
  end
end
