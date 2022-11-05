# require_relative '../rails_helper'

# RSpec.describe 'user_show', type: :feature do
#   before(:each) do
#     DatabaseCleaner.clean
#     @user = User.create(
#       name: 'zubair',
#       photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#       bio: 'full-stack developer.',
#       posts_counter: 0
#     )

#     @post1 = Post.new(title: 'firstpost', text: 'post one', comments_counter: 0, likes_counter: 0)
#     @post1.user_id = @user.id
#     @post1.save

#     @post2 = Post.new(title: 'secondpost', text: 'post two', comments_counter: 0, likes_counter: 0)
#     @post2.user_id = @user.id
#     @post2.save

#     @post3 = Post.new(title: 'thirdpost', text: 'post thire', comments_counter: 0, likes_counter: 0)
#     @post3.user_id = @user.id
#     @post3.save

#     visit "/users/#{@user.id}"
#   end

#   it 'shows the username of the users' do
#     expect(page).to have_content("#{@user.name}")
#   end

#   it 'shows the photos of the users' do
#     expect(page.html).to include('user-img')
#   end

#   it 'shows the number of post of each user' do
#     expect(page).to have_content("#{@user.posts_counter}")
#   end

#   it 'shows the bio of the user' do
#     expect(page).to have_content("#{@user.bio}")
#   end

#   it ' shows the first 3 posts' do
#     post = Post.find(@post1.id)
#     post2 = Post.find(@post2.id)
#     post3 = Post.last
#     expect(page).to have_content("#{post.title}")
#     expect(page).to have_content("#{post2.title}")
#     expect(page).to have_content("#{post3.title}")
#   end

#   it 'test all posts button' do
#     click_link('ALL Posts')
#     expect(page.current_path).to eql("/users/#{@user.id}/posts")
#   end

#   it 'clicking user post send to post show page' do
#     user = User.last
#     post = Post.last
#     click_link(post.title)
#     expect(page.current_path).to eql("/users/#{user.id}/posts/#{post.id}")
#   end
# end
