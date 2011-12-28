class Product < ActiveRecord::Base
  include ExtensionInitializer
  paginates_per 9
  #before_validation :set_product_type_id
  
  has_many :targets
  has_one :users, :through => :targets
  has_many :order_items
  validates_presence_of :name, :product_type
  acts_as_commentable
  has_attached_file :image, :styles => {:large => "270x270>", :medium => '150x150', 
                    :thumb => "50x50"}, :default_url => '/system/images/:style/missing.png', 
                    :url  => "system/images/:id/:style/:basename.:extension", 
                    :path => ":rails_root/public/assets/system/images/:id/:style/:basename.:extension"
attr_accessible :genre_id, :producer, :image, :name, :description,:product_type, 
        :product_type_id, :image, :style, :group, :album, :count_on_hand, :price, :available_on
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  attr_reader :video_product_type_id

  def available?
    if self.available_on.nil? or self.available_on > DateTime.parse(Time.now.to_s)
      false
    else
      true
    end
  end

  def set_product_type_id
    self.product_type_id = ProductType.find_by_name(self.product_type).id
  end
end
