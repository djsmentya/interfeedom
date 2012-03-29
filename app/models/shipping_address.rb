# -*- encoding : utf-8 -*-
class ShippingAddress < ActiveRecord::Base
   belongs_to :profile

  attr_accessor :full_address

  def full_address
    [self.region, self.city, self.street, self.house_number, self.flat].join(', ')
  end
end
