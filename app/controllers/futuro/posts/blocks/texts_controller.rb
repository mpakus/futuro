class Futuro::Posts::Blocks::TextsController < Futuro::Posts::Blocks::ApplicationController
  def update
    find_text
    @text.update_attributes(content: params[:text])
    render json: { status: 'ok' }
  end

  private

  def find_text
    @text = Post::Block::Text.find(params[:id])
    check_block_permission!(@text, current_user)
  end
end
