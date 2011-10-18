class Product < ActiveRecord::Base
  belongs_to :category, :dependent => :destroy, :polymorphic => true

  validates_presence_of :category

  scope :videos,:conditions => {:category_type => 'Video'}
end
