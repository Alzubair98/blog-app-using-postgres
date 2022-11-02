require_relative '../rails_helper'

RSpec.describe 'user_show', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
    @user = User.create(
      name: 'zubair',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'full-stack developer.',
      posts_counter: 0
    )

    @post1 = Post.new(title: 'firstpost', text: 'post one', comments_counter: 0, likes_counter: 0)
    @post1.user_id = @user.id
    @post1.save

    @comment1 = Comment.new(text: 'first comment')
    @comment1.user_id = @user.id
    @comment1.post_id = @post1.id
    @comment1.save

    visit "/users/#{@user.id}/posts/#{@post1.id}"
  end

  it ' see the post title ' do
    expect(page).to have_content("#{@post1.title}")
  end

  it ' post writer ' do
    expect(page).to have_content("#{@post1.user.name}")
  end

  it 'see how many comments the post has' do
    expect(page).to have_content("#{@post1.comments_counter}")
  end

  it 'see how many likes the post has' do
    expect(page).to have_content("#{@post1.likes_counter}")
  end

  it 'post body' do
    expect(page).to have_content("#{@post1.text}")
  end

  it 'see comment owner username' do
    expect(page).to have_content("#{@comment1.user.name}")
  end

  it 'see the comment body ' do
    expect(page).to have_content("#{@comment1.text}")
  end
end
