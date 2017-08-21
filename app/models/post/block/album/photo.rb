# frozen_string_literal: true

class Post::Block::Album::Photo < ActiveRecord::Base
  belongs_to :album, class_name: 'Post::Block::Album', foreign_key: :album_id
  mount_uploader :image, PhotoUploader
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
