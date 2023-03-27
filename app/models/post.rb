class Post < ApplicationRecord
    has_many :post_comments
    has_many :post_likes
end
