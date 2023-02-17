class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
    add_reference :comments, :users, foreign_key: true
    add_reference :comments, :events, foreign_key: true
  end
end
