class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :area
      t.string :landmark
      t.string :city
      t.integer :pincode
      t.string :type
      t.integer :user_id 
      t.timestamps
    end
  end
end
