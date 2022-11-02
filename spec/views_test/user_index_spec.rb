require_relative '../rails_helper'

RSpec.describe 'user_index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'zubair',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Programmer from Iraq.',
      posts_counter: 0
    )
    visit root_path
  end

  it 'shows the username of the users' do
    expect(page).to have_content("#{@user.name}")
  end

  it 'shows the photo of the user' do 
    expect(page.html).to include("user-img")
  end

  it 'shows the number of posts' do
    expect(page).to have_content("#{@user.posts_counter}")
  end

  it 'should redirect to user show page when a name is clicked' do
    user = User.last
    click_link(user.name)
    expect(page.current_path).to eql("/users/#{user.id}")
  end

  

end