# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :person, :saler
  
  ajaxful_rater

  ajaxful_rateable :stars => 5, :allow_update => false
  after_create :set_user_role

  has_many :products
  has_many :assignments
  has_many :roles, :through => :assignments
  has_one :profile
  has_many :messages
  has_many :orders
  #select roles for Authorization
  def role_symbols
    (roles || []).map { |r| r.title.to_sym }
  end

  def saler?
    self.saler ||= self.roles.exists?(:title => 'saler')
  end
  
  def self.authenticate(email, password)
    user = User.find_for_authentication(:email => email)
    user.valid_password?(password) ? user : nil
  end
  
  protected
  def set_user_role
    Assignment.create(:user_id =>self.id, :role_id => Role.customer)
  end
end
