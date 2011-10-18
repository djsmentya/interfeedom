class Product < ActiveRecord::Base
  belongs_to :category, :dependent => :destroy, :polymorphic => true

  #validates_presence_of :category

  scope :videos, :conditions => {:category_type => 'Video'}

  has_attached_file :image, :styles => {:medium => "300x300>", :thumb => "150x150>"}, :default_url => '/system/images/thumb/missing.png'


  def available?
    if self.avalible_on.nil? or self.avalible_on > DateTime.parse(Time.now.to_s)
      false
    else
      true
    end
  end
end
