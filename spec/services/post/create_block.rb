# frozen_string_literal: true

RSpec.describe Post::CreateBlock do
  let(:post) { FactoryGirl.create(:post) }

  describe '#perform' do
    before { @block = Post::CreateBlock.new(post, 'text').perform }

    it 'result is Post::Block class' do
      expect(@block.class.to_s).to eq 'Post::Block'
    end
    it 'result.blockable is Post::Block::Text class' do
      expect(@block.blockable.class.to_s).to eq 'Post::Block::Text'
    end
  end
end
