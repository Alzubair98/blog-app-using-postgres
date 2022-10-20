require_relative "../rails_helper"

RSpec.describe Post, type: :post do 
    subject { User.new(name: "alzubair", posts_counter: 0) }
    before { @new_post = Post.new(user: subject,title: "alzubair", likes_counter: 0, comments_counter: 0) }
    
    

    it "title should be present" do
        @new_post.title = nil
        expect(@new_post).to_not be_valid  
    end

    it "title should be present" do
        @new_post.title = "hello"
        expect(@new_post).to be_valid  
    end

    it 'likes counter should be integer' do
        @new_post.likes_counter = "hi"
        expect(@new_post).to_not be_valid
    end

    it 'likes counter should be integer' do
        @new_post.likes_counter = 0
        expect(@new_post).to be_valid
    end

    it 'last 5 comments function test' do
        expect(@new_post.most_recent_comments).to eq([])
    end
end