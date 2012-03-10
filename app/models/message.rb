class Message < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :to_user_id, :title, :body
end
