class Video < ActiveRecord::Base
  has_many :product, :as => :properties
end
