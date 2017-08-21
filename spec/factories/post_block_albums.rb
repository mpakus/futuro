# frozen_string_literal: true

require_dependency 'post/block/album'

FactoryGirl.define do
  factory :post_block_album, class: 'Post::Block::Album' do
  end
end

# == Schema Information
#
# Table name: post_block_albums
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  kind       :integer          default("grid")
#  updated_at :datetime         not null
#
