class Likes < ApplicationRecord
    def likes
        belongs_to :user, class_name: 'User'
        belongs_to :post, class_name: 'Post'
    end
end