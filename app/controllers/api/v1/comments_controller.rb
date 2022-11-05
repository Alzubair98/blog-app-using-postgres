class Api::V1::CommentsController < ApplicationController
    
    def new 
    end
    
    def create
        @comment = Comment.new(params.require(:comment).permit(:text))

        if @comment.save 
            render json: @comment, status: 200
        else  
            render json: {
                error: "Error Creating.."
            }
        end
    end
end