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

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
