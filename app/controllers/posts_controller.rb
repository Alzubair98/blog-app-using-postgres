class PostsController < ApplicationController
  def show
    find_post
    @comments = @post.most_recent_comments
    @user = User.all
  end

  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    flash[:notice] = 'Post created successfully' if @post.save
    redirect_to user_posts_path
  end

  def destroy 
    find_post
    @post.destroy
    redirect_to user_posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
