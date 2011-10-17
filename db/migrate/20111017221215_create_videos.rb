class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :genre
      t.string :producers
      t.date :completion_year

      t.timestamps
    end
  end
end
