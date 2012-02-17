class Product < ActiveRecord::Base
  scope :video, where(:product_type => 'Video')
  scope :audio, where(:product_type => 'Audio')

  ajaxful_rateable :stars => 5, :dimensions => [:speed], :allow_update => true

  translates :name, :description, :fallbacks_for_empty_translations => true
  globalize_accessors :locales => [:en, :ua], :attributes => [:name, :description]

  include ExtensionInitializer

  paginates_per 9
  #before_validation :set_product_type_id
  belongs_to :user
  has_many :order_items
  validates_presence_of :name, :product_type
  acts_as_commentable
  has_attached_file :image, :styles => {:large => "270x270>", :medium => '150x150',
                    :thumb => "50x50"}, :default_url => '/system/images/:style/missing.png',
                    :url  => "system/images/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/system/images/:id/:style/:basename.:extension"

attr_accessible :genre_id, :producer, :image, :name, :description,:product_type,
        :product_type_id, :image, :style, :group, :album, :count_on_hand, :price, :available_on,
        :name_en, :name_ua, :description_en, :description_ua
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
