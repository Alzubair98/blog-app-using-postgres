class CommentsController < ApplicationController
    def def new
        @comment = Comment.new
    end
    

    def create 
        @comment = Comment.new(params.require(:comment).permit(:text))
        @post = Post.find(params[:post_id])
        @comment.user_id = current_user.id 
        @comment.post_id = @post.id
        if @comment.save 
            flash[:notice] = "Comment created successfully"
            redirect_to @comment
        end
    end
end