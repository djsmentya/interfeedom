class TranslateProducts < ActiveRecord::Migration
  def up
    Product.create_translation_table!({
        :name => :string,
        :description => :text
      }, {
        :migrate_data => true
      })
      remove_column :products, :name, :description
  end

  def down
    add_column :products, :description, :text
    add_column :products, :name, :string
          Product.drop_translation_table! :migrate_data => true
  end
end
