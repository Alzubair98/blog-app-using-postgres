class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  belongs_to :user
  after_save :upadate_posts_counter
  after_destroy :upadate_posts_counter

  def upadate_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
