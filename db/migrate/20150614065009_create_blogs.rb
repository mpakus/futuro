# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :name, limit: 255
      t.string :uri, limit: 255, index: true
      t.text   :description
      t.string :image
      t.integer :variant
      t.references :user
      t.string :token, limit: 24, index: true, uniq: true
      t.text   :settings
      t.timestamps null: false
    end
  end
end
