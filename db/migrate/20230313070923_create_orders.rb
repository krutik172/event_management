class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer
      t.bigint :product_id 
      t.integer :quantity
      t.timestamps
    end
    add_foreign_key :orders, :products
  end
end
