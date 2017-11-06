class CreateShippingInfo < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_infos do |t|
      t.string :shipping_type
      t.integer :shipping_cost
      t.integer :shipping_region_id
      t.timestamps
    end
    add_index :shipping_infos, :id, unique: true
  end
end
