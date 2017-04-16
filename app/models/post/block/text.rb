# frozen_string_literal: true

class Post::Block::Text < ActiveRecord::Base
  has_one :post_block, as: :blockable, class_name: 'Post::Block'
  has_one :post, through: :post_block
end
