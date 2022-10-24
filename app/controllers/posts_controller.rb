class PostsController < ApplicationController
    def show 
       find_post
    end

    def index 
        @posts = Post.all
    end

    private 
    def find_post 
        @user = Post.find(params[:id])
    end
end
