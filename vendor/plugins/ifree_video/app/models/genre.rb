# -*- encoding : utf-8 -*-
class Genre < ActiveRecord::Base
  has_many :products
end
