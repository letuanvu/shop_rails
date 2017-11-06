class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.timestamps
      t.float :unit_price
      t.timestamps
    end

    add_reference :order_products, :products, foreign_key: true
    add_reference :order_products, :orders, foreign_key: true
  end
end
