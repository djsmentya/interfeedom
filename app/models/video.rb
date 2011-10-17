class Video < ActiveRecord::Base
  has_many :product, :as => :category
end
