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
end