class AddForeginKeyToEvent < ActiveRecord::Migration[7.0]
  def change
     add_reference :events, :organisor_id, foreign_key: { to_table: :users }
  end
end
