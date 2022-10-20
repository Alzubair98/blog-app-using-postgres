require_relative '../rails_helper'

RSpec.describe Like, type: :like do
  it 'update_counter_likes' do
    user = User.create!(name: 'zubair', posts_counter: 0)
    post = Post.create!(user:, title: 'post', comments_counter: 0, likes_counter: 0)
    Like.create!(user:, post:)
    final_post = Post.last
    expect(final_post.likes_counter).to eq 1
  end
end
