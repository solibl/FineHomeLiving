class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :location, null: false
      t.text :album_description, null: false
      t.attachment :image

      t.timestamps
    end
  end
end
