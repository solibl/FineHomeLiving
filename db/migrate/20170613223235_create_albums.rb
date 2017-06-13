class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :location
      t.text :album_description

      t.timestamps
    end
  end
end
