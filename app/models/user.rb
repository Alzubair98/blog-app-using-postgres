class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def last_3_posts
    posts.last(3)
  end
end
