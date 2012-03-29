# -*- encoding : utf-8 -*-
class RenameColumnTitleComments < ActiveRecord::Migration
  def up
    rename_column(:comments, :title, :author)
  end

  def down
    rename_column(:comments, :author, :title)
  end
end
