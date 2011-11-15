class Product < ActiveRecord::Base
  paginates_per 9
  include ExtensionInitializer
  #belongs_to :properties, :dependent => :destroy, :polymorphic => true
  belongs_to :product_type
  validates_presence_of :name

  has_attached_file :image, :styles => {:large => "300x300>", :medium => '150x150', :thumb => "50x50"}, :default_url => '/system/images/:style/missing.png', :url  => "system/images/:id/:style/:basename.:extension", :path => ":rails_root/public/system/images/:id/:style/:basename.:extension"
attr_accessible :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  #,:url => '/system/:class/:attachment/:id/:style/:filename'
  attr_reader :video_product_type_id

  def available?
    if self.available_on.nil? or self.available_on > DateTime.parse(Time.now.to_s)
      false
    else
      true
    end
  end
end
