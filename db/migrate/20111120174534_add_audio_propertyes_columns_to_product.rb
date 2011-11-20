class AddAudioPropertyesColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :style, :string
    add_column :products, :group, :string
    add_column :products, :album, :string
  end
end
