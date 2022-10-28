class CommentsController < ApplicationController
  def new; end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @post = Post.find(params[:post_id])
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    flash[:notice] = 'Comment created successfully' if @comment.save

    redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
  end
end
