class AddColumnCheckedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :checked, :boolean, :default => false
  end
end
