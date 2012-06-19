# -*- encoding : utf-8 -*-
class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  layout 'pay_pal'
  def create
    PaymentNotification.create!(:params => params, :order_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end

  def pay_pal_payment
        @products = {'1' => {:name => nil, :quantity => nil, :price => nil}}
    params.each do |key, value|
      pr = key.scan(/\d/).first
      unless @products.include?(pr) and !pr.nil?
        @products[pr] = {:name => nil, :quantity => nil, :price => nil}
      end

      unless pr.nil?
        case key.scan(/.\S*/).first
        when key.scan(/item_name_\d/).first
          @products[pr][:name] = value
        when key.scan(/quantity_\d/).first
          @products[pr][:quantity] = value
        when key.scan(/amount_\d/).first
          @products[pr][:price] = value
        when key.scan(/item_namber_\d/).first
          @products[pr][:number] = value
        end
      end
    end
    return @products.delete(nil)
  end
end
