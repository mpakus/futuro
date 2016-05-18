# frozen_string_literal: true
class Post::CreateBlock
  def initialize(post, block)
    @post = post
    @block = "Post::Block::#{block.camelize}".constantize
  end

  def perform
    @post.list_of_blocks.create(blockable: @block.new)
  end
end
