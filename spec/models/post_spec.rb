require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'check empty title' do
    post = build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'check length of title' do
    post = build(:post, title: 'MpaK' * 100)
    post.valid?
    expect(post.errors[:title]).to include('is too long (maximum is 255 characters)')
  end
end
