# frozen_string_literal: true

class Post::Block::Album::Photo < ActiveRecord::Base
  belongs_to :album, class_name: 'Post::Block::Album', foreign_key: :album_id
  mount_uploader :image, PhotoUploader
end
