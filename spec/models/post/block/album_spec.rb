require_relative '../../../../app/models/post/block/album'

RSpec.describe Post::Block::Album, type: :model do
  context 'with kind' do
    it { expect(Post::Block::Album.kinds.keys).to eq %w(grid slide).freeze }
  end
end
