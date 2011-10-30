class ProductType < ActiveRecord::Base

  def self.video
    ProductType.find_by_name('Video').products
  end
end
