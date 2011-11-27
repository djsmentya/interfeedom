class Order < ActiveRecord::Base
  has_many :order_items, :dependent =>:destroy
  belongs_to :user
  validates_presence_of :recipient, :phone
  before_create :set_in_progress_state

  def set_in_progress_state
    self.state = 'in_progress'
  end
  def set_new_state
    self.state = 'new'
  end
end
