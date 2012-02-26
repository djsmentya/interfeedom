class Comment < ActiveRecord::Base
scope :checked, where(:checked => true)
scope :unchecked, where(:checked => false)

  include ActsAsCommentable::Comment
#attr_accessor :author, :comment, :text
  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  # NOTE: Comments belong to a user
  belongs_to :user

  def text
    self.comment
  end

  def text=(message)
    self.comment = message
  end
end
