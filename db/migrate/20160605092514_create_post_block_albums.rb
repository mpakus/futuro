class CreatePostBlockAlbums < ActiveRecord::Migration
  def change
    create_table :post_block_albums do |t|
      t.integer :kind, default: 0, limit: 1
      t.timestamps null: false
    end
  end
end
