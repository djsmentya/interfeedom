class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :genre_id, :integer
    add_column :products, :producer, :string
  end
end
