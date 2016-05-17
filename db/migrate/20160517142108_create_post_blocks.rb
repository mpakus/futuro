# frozen_string_literal: true
class CreatePostBlocks < ActiveRecord::Migration
  def change
    create_table :post_blocks do |t|
      t.references :post, index: true, foreign_key: true
      t.integer :position, limit: 2, default: 0
      t.references :blockable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
