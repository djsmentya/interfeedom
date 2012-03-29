# -*- encoding : utf-8 -*-
class Target < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
end
