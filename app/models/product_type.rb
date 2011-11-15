class ProductType < ActiveRecord::Base
  has_many :products
  validates_uniqueness_of :name
  #validates_presence_of :name

  def self.video
    ProductType.find_by_name('Video')
  end

  def self.audio
    ProductType.find_by_name('Audio')
  end
end
