# -*- encoding : utf-8 -*-
class Style < ActiveRecord::Base
  validates_presence_of :name
end
