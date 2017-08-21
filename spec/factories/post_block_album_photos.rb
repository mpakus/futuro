# frozen_string_literal: true

require_dependency 'post/block/album/photo'

FactoryGirl.define do
  factory :post_block_album_photo, class: 'Post::Block::Album::Photo' do
    association :album, factory: :post_block_album
  end
end

# == Schema Information
#
# Table name: post_block_album_photos
#
#  album_id   :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  image      :string(255)
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_block_album_photos_on_album_id  (album_id)
#
