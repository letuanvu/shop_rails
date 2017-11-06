class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :customerName
      t.string :creditCardInfo
      t.text :address
      t.timestamps
    end
    add_index :customers, :id, unique: true
    add_reference :customers, :accounts, foreign_key: true
  end
end
