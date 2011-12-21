class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments


  def self.customer
    Role.find_by_title 'customer'
  end
  
  def self.saler
    Role.find_by_title 'saler'
  end
end
