class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :orders, :recipient, :string
    add_column :orders, :email, :string
    add_column :orders, :phone, :string
    add_column :orders, :comment, :text

  end
end
