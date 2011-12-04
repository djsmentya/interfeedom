class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :person

  after_create :set_user_role

  has_many :assignments
  has_many :roles, :through => :assignments
  has_one :profile
  has_many :products, :through => :target
  has_many :orders
  #select roles for Authorization
  def role_symbols
    (roles || []).map { |r| r.title.to_sym }
  end
  def self.saler?
    self.roles.exist?('title = Saler')
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
