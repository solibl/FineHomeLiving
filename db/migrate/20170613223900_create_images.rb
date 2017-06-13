class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.attachment :image
      t.references :album, foreign_key: true
      
      t.timestamps, null: false
    end
  end
end
