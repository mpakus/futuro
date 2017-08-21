# frozen_string_literal: true

class Post::Block::Album < ActiveRecord::Base
  has_one :post_block, as: :blockable, class_name: 'Post::Block'
  has_many :photos, class_name: 'Post::Block::Album::Photo'
  enum kind: %i[grid slide]
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
