# frozen_string_literal: true

class Futuro::Posts::BlocksController < Futuro::ApplicationController
  before_action :find_user_post, only: [:create]

  # Add new Block for Post
  def create
    @block = Post::CreateBlock.new(@post, find_block).perform
  end

  private

  def find_block
    raise ActiveRecord::RecordNotFound unless Post::Block::KINDS.include?(params[:block])
    @type = params[:block]
  end
end
