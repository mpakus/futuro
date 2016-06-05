# frozen_string_literal: true
class Futuro::Posts::Blocks::Albums::PhotosController < Futuro::Posts::Blocks::ApplicationController
  def create
    find_album
    @photo = @album.photos.create(image: params[:image])
    # @TODO: move all block to plural path as controllers
    render template: 'futuro/posts/blocks/album/create'
  end

  private

  def find_album
    @album = Post::Block::Album.find(params[:album_id])
    check_block_permission!(@album.post_block, current_user)
  end
end
