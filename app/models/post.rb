class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments
  has_many :likes
  belongs_to :user
  after_create :update_counter

  def upadate_countr
    if user.posts_countr
      user.posts_counter += 1
    else
      user.posts_counter = 1
    end
    user.save
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
