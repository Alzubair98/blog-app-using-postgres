class CommentsController < ApplicationController
    def def new
        
    end
    
    def create 
        @comment = Comment.new(params.require(:comment).permit(:text))
        @post = Post.find(params[:post_id])
        @comment.user_id = current_user.id 
        @comment.post_id = @post.id
        if @comment.save 
            flash[:notice] = "Comment created successfully"
            redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
        else  
            redirect_to users_path
        end
    end

end