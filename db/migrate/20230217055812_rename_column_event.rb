class RenameColumnEvent < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :organisor_id_id, :organisor_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
