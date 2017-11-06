class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      # t.text :categories, array: true, default: []
      t.timestamps
    end
    # add_column :products, :categories, :text, default: []
    add_index :products, :id, unique: true

  end
end
