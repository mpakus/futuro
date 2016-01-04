require 'rails_helper'

describe Post, type: :model do
  context 'validation' do
    it 'check empty title' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include "can't be blank"
    end

    it 'check length of title' do
      post = build(:post, title: 'MpaK' * 100)
      post.valid?
      expect(post.errors[:title]).to include 'is too long (maximum is 255 characters)'
    end

    it 'check empty blog' do
      post = build(:post, blog: nil)
      post.valid?
      expect(post.errors[:blog_id]).to include "can't be blank"
    end

    it 'check empty author' do
      post = build(:post, author: nil)
      post.valid?
      expect(post.errors[:user_id]).to include "can't be blank"
    end
  end

  context 'scopes' do
    it 'filter by author' do
      user1 = create(:user, name: 'MpaK')
      user2 = create(:user, name: 'Devil')

      create_list(:post, 7, author: user1)
      create_list(:post, 5, author: user2)

      expect(Post.where(author: user1).all.count).to eq 7
      expect(Post.by_author(user2).all.count).to eq 5
    end

    it 'sort newests' do
      p2 = create(:post, created_at: '01-01-2015')
      p3 = create(:post, created_at: '01-06-2014')
      p1 = create(:post, created_at: '01-09-2015')

      expect(Post.newests.all.to_a).to eq [p1, p2, p3]
    end
  end

  it 'cut content to 150 symbols for content_cut' do
    post = create(:post, content: Faker::Lorem.sentence(1000))
    expect(post.content_cut.length).to eq 150
  end

  it 'to_uri return right hash' do
    post = create(:post)
    uri_hash = { blog: post.blog.uri, id: post.id }
    expect(post.to_uri).to eq uri_hash
  end
end
