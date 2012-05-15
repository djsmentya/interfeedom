# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
  scope :in_progress, where(:state => 'in_progress')
  scope :completed, where(:state => 'completed')
  has_many :order_items, :dependent =>:destroy
  has_many :products , :through => :order_items
  belongs_to :user
  before_create :set_in_progress_state
  validates_presence_of :recipient, :phone
  def set_in_progress_state
    self.state = 'in_progress'
  end
  def set_new_state
    self.state = 'new'
  end

  def paypal_url(return_url, notify_url)
  #values = {
    #:business => APP_CONFIG[:paypal_email],
    #:cmd => '_order',
    #:upload => 1,
    #:return => return_url,
    #:invoice => id,
    #:notify_url => notify_url
  #}
  values = {
    :business => APP_CONFIG[:paypal_email],
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id,
    :notify_url => notify_url
  }
  order_items.each_with_index do |item, index|
    values.merge!({
      "amount_#{index+1}" => item.product.price,
      "item_name_#{index+1}" => item.product.name,
      "item_number_#{index+1}" => item.id,
      "quantity_#{index+1}" => item.quantity
    })
  end
  APP_CONFIG[:paypal_url] + values.to_query
end
end
