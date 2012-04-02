class Withdraw < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :amount, :payment_type
  validates :amount, :numericality => true
  attr_accessible :amount, :payment_type, :user_id

  #before_create do |withdraw|
    #withdraw.state = 'in_progress'
  #end
end
