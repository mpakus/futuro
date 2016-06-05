FactoryGirl.define do
  factory :post_block_album_photo, class: 'Post::Block::Album::Photo' do
    image "MyString"
    album_id 1
  end
end
