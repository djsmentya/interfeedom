class Profile < ActiveRecord::Base
  belongs_to :user
  has_one :shipping_address, :dependent => :destroy

  attr_accessor :person

  def person
    [self.first_name, self.last_name].join(' ')
  end

  alias_method :full_name, :person
  alias_method :name, :person
end
