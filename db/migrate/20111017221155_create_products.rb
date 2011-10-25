class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.datetime :avalible_on
      t.integer :count_on_hand, :default => 0, :null => false
      t.references :properties, :polymorphic => true

      t.timestamps
    end
    add_index :products, :properties_id
  end
end
