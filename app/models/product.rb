class Product < ActiveRecord::Base
  paginates_per 9
  include ExtensionInitializer
  #belongs_to :properties, :dependent => :destroy, :polymorphic => true
  #belongs_to :product_type    
  #has_many :comments, :as => :commentable
  validates_presence_of :name
  acts_as_commentable
  has_attached_file :image, :styles => {:large => "300>x270", :medium => '150x150', :thumb => "50x50"}, :default_url => '/system/images/:style/missing.png', :url  => "system/images/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/system/images/:id/:style/:basename.:extension"
attr_accessible :image, :name, :description, :product_type_id, :image
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
