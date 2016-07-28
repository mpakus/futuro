class CreatePostBlockAlbumPhotos < ActiveRecord::Migration
  def change
    create_table :post_block_album_photos do |t|
      t.string :image
      t.integer :album_id, index: true

      t.timestamps null: false
    end
  end
end
