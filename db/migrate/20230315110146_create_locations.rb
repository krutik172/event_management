class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :house
      t.string :society
      t.string :road
      t.string :area
      t.string :city
      t.integer :pincode

      t.timestamps
    end
    add_reference :locations, :employee, foregin_key: true
  end
end
