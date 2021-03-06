# frozen_string_literal: true

class CreatePostBlockTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :post_block_texts do |t|
      t.text :content, limit: 4_294_967_295

      t.timestamps null: false
    end
  end
end
