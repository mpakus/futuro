class Post::Block::Album < ActiveRecord::Base
  has_one :post_block, as: :blockable, class_name: 'Post::Block'
  has_many :photos, class_name: 'Post::Block::Album::Photo'
  enum kind: [:grid, :slide]
end
