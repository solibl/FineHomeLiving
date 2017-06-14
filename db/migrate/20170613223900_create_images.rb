class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :album, foreign_key: true
      
      t.timestamps
    end
  end
end
