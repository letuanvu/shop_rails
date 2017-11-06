class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :orderStatus
      t.timestamps
    end
    add_index :orders, :id, unique: true
    add_reference :orders, :shipping_infos, foreign_key: true
    add_reference :orders, :customers, foreign_key: true
  end
end
