# frozen_string_literal: true

require_dependency 'post/block/album/photo'

FactoryGirl.define do
  factory :post_block_album_photo, class: 'Post::Block::Album::Photo' do
    association :album, factory: :post_block_album
  end
end
