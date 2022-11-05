require 'rails_helper'

RSpec.describe 'Api::V1::Posts', type: :request do
  before(:each) do
        DatabaseCleaner.clean_with(:truncation)
        @user = User.create(
          name: 'zubair',
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: 'full-stack developer.',
        )
    
        @post1 = Post.new(title: 'firstpost', text: 'post one')
        @post1.user_id = @user.id
        @post1.save
    
        @comment1 = Comment.new(text: 'first comment')
        @comment1.user_id = @user.id
        @comment1.post_id = @post1.id
        @comment1.save
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/posts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/api/v1/posts/#{@post1.id}/show"
      expect(response).to have_http_status(:success)
    end
  end
end
