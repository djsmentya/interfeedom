class ProductType < ActiveRecord::Base

  def self.audio
    ProductType.find_by_name('Audio')
  end
end
