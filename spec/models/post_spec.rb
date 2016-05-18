# frozen_string_literal: true
RSpec.describe Post, type: :model do
  context 'with validation' do
    it 'check empty title' do
      post = FactoryGirl.build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include "can't be blank"
    end

    it 'check length of title' do
      post = FactoryGirl.build(:post, title: 'MpaK' * 100)
      post.valid?
      expect(post.errors[:title]).to include 'is too long (maximum is 255 characters)'
    end

    it 'check empty blog' do
      post = FactoryGirl.build(:post, blog: nil)
      post.valid?
      expect(post.errors[:blog]).to include "can't be blank"
    end

    it 'check empty author' do
      post = FactoryGirl.build(:post, author: nil)
      post.valid?
      expect(post.errors[:author]).to include "can't be blank"
    end
  end

  context 'with callbacks' do
    it 'cut content to 150 symbols for content_cut' do
      post = FactoryGirl.create(:post, content: Faker::Lorem.sentence(1000))
      expect(post.content_cut.length).to eq 150
    end
  end

  describe '.by_author' do
    it 'sort by author' do
      user1 = FactoryGirl.create(:user, name: 'MpaK')
      user2 = FactoryGirl.create(:user, name: 'Devil')

      FactoryGirl.create_list(:post, 7, author: user1)
      FactoryGirl.create_list(:post, 5, author: user2)

      expect(Post.where(author: user1).all.count).to eq 7
      expect(Post.by_author(user2).all.count).to eq 5
    end
  end

  describe '.newests' do
    before do
      @p3 = FactoryGirl.create(:post)
      @p2 = FactoryGirl.create(:post)
      @p1 = FactoryGirl.create(:post)
    end
    it 'sort by created_at' do
      expect(Post.newests.to_a).to eq [@p3, @p2, @p1]
    end
  end

  describe '#to_uri' do
    it 'returns right hash' do
      post = FactoryGirl.create(:post)
      uri_hash = { blog: post.blog.uri, id: post.id }
      expect(post.to_uri).to eq uri_hash
    end
  end
end
