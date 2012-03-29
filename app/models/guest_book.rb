# -*- encoding : utf-8 -*-
class GuestBook < ActiveRecord::Base
  validates_presence_of :name, :text
    acts_as_commentable
end
