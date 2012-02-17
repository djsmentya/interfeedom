class CreateGuestBooks < ActiveRecord::Migration
  def change
    create_table :guest_books do |t|
      t.string :name
      t.string :email
      t.text :text

      t.timestamps
    end
  end
end
