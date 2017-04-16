# frozen_string_literal: true

class AddContentCutToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content_cut, :text
  end
end
