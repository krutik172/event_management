class RenameUserIdInAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :user_id, :addressable_id 
    add_column :addresses, :addressable_type, :string
    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
