# frozen_string_literal: true

class Futuro::Posts::Blocks::AlbumsController < Futuro::Posts::Blocks::ApplicationController
  def update
    find_text
    @text.update(content: params[:text])
    render json: { status: 'ok' }
  end

  private

  def find_album
    @text = Post::Block::Album.find(params[:id])
    check_block_permission!(@text, current_user)
  end
end
