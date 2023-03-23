class CreatePostLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :post_likes do |t|
      t.timestamps
    end
    add_reference :post_likes, :user
    add_reference :post_likes, :post
  end
end
