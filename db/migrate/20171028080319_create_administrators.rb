class CreateAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :administrators do |t|
      t.string :admin_name
      t.timestamps
    end
    add_reference :administrators, :accounts, foreign_key: true
    add_index :administrators, :id, unique: true
  end
end
