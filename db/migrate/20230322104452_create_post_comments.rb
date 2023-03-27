class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.string :comment
      t.timestamps
    end
    add_reference :post_comments, :post
    add_reference :post_comments, :user
  end
end
