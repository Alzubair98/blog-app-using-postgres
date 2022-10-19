class Comment < ApplicationRecord
        belongs_to :user
        belongs_to :post
        after_create :update_counter


        def update_counter 
                if !post.comments_counter
                    post.comments_counter = 1
                    post.save
                else 
                    post.comments_counter += 1
                    post.save
                end
        end
end