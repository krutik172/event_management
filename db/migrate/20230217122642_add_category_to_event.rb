class AddCategoryToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :category_id, :integer
    add_foreign_key :events, :categories
  end
end
