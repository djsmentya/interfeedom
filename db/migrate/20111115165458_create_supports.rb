class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :subject
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
