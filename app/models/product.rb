class Product < ActiveRecord::Base
  belongs_to :properties, :dependent => :destroy, :polymorphic => true

  validates_presence_of :properties

  scope :videos, :conditions => {:properties_type => 'Video'}

  has_attached_file :image, :styles => {:large => "300x300>", :medium => '150x150', :thumb => "50x50>"}, :default_url => '/system/images/thumb/missing.png'


  def available?
    if self.avalible_on.nil? or self.avalible_on > DateTime.parse(Time.now.to_s)
      false
    else
      true
    end
  end
end
