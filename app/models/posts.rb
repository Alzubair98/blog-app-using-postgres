class Post < ApplicationRecord
    has_many :comments, foreign_key: 'post_id'
    has_many :likes
    belongs_to :user, class_name: 'User'
end