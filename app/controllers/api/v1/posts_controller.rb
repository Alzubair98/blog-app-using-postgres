class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.most_recent_comments
    @user = User.all
    render json: @post.to_json(include: [:comments])
  end
end
