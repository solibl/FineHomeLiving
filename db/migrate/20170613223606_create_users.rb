class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.email :email, null: false
      t.integer :admin_status, null: false

      t.timestamps, null: false
    end
  end
end
