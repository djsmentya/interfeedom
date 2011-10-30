class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :genre, :string
    add_column :products, :producer, :string
  end
end
