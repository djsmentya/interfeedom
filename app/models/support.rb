# -*- encoding : utf-8 -*-
class Support < ActiveRecord::Base
  validates :email,   
            :presence => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  
end    
