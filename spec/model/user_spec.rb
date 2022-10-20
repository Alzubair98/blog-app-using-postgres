require_relative "../rails_helper"

RSpec.describe User, type: :user do 
    subject { User.new(name: "alzubair", posts_counter: 0) }

    before { subject.save }

    it 'name should be present' do
        subject.name = nil
        expect(subject).to_not be_valid  
    end

    it 'name should be present' do
        subject.name = "alzubair"
        expect(subject).to be_valid
    end

    it 'posts counter should be integer' do
        subject.posts_counter = "hi"
        expect(subject).to_not be_valid
    end

    it 'posts counter should be integer' do
        subject.posts_counter = 9
        expect(subject).to be_valid
    end

    it 'last 3 posts function test' do
        expect(subject.last_3_posts).to eq([])
    end


end