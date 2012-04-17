class Withdraw < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :amount, :payment_type
  validates :amount, :numericality => true
  before_create :amount_cannot_be_higher_then_user_money
  attr_accessible :amount, :payment_type, :user_id

 def amount_cannot_be_higher_then_user_money
   money =  self.user.money
    unless money >= amount
      errors.add(:amount, I18n.t('errors.withdraw.less')+ money.to_s)
    end
 end
end
