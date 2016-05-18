# frozen_string_literal: true
RSpec.describe Post::Block, type: :model do
  context 'with order' do
    before do
      @post = FactoryGirl.create(:post)
      @block1 = @post.blocks.create
      @block2 = @post.blocks.create
    end

    it 'fetch blocks by order' do
      expect(@post.blocks.to_a).to eq [@block1, @block2]
    end
  end
end
