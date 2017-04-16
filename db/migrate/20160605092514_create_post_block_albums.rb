# frozen_string_literal: true

class CreatePostBlockAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :post_block_albums do |t|
      t.integer :kind, default: 0, limit: 1
      t.timestamps null: false
    end
  end
end
