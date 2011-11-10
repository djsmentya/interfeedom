class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  validates_presence_of :recipient, :phone
  before_create :set_new_state

  def set_new_state
    self.state = 'new'
  end
end
