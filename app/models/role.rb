class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments


  def self.customer
    self.find_by_title 'customer'
  end
end
