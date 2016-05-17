# frozen_string_literal: true
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string     :title, limit: 255
      t.text       :content, limit: 4_294_967_295
      t.integer    :access, limit: 1, index: true
      t.references :blog
      t.references :user
      t.string :token, limit: 24, index: true, uniq: true
      t.timestamps null: false
    end
  end
end
