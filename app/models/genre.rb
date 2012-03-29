# -*- encoding : utf-8 -*-
class Genre < ActiveRecord::Base
  has_many :products
  validates_presence_of :name
end
