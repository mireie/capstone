class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :artist1
      t.string :artist2
      t.string :artist3
      t.string :artist4
      t.datetime :showtime
      t.text :details
      t.decimal :price, :precision => 8, :scale => 2
      t.boolean :all_ages
      t.string :url
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
