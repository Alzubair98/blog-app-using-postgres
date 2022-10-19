class Like < ApplicationRecord
        belongs_to :user
        belongs_to :post
        after_create :update_counter

        def update_counter
            if !post.likes_counter
                post.likes_counter = 1
                post.save
            else 
                post.likes_counter += 1
                post.save
            end
        end
end