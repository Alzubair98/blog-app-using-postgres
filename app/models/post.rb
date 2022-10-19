class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :user
    after_create :update_counter

    def upadate_countr 
        if !user.posts_countr 
            user.posts_counter = 1
            user.save 
        else
            user.posts_counter +=1
            user.save
        end
    end
    
    def most_recent_comments 
        comments.limit(5).order(created_at: :desc)
    end
end