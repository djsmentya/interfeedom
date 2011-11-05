class Genre < ActiveRecord::Base
  has_many :products
end
