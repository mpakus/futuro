# frozen_string_literal: true
RSpec.describe Post::Block, type: :model do
  context 'with order' do
    before do
      @post = FactoryGirl.create(:post)
      @block1 = @post.list_of_blocks.create!
      @block2 = @post.list_of_blocks.create!
    end

    it 'fetch blocks by order' do
      expect(@post.list_of_blocks.to_a).to eq [@block1, @block2]
    end
  end
end
