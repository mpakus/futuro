# frozen_string_literal: true
class AddContentCutToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :content_cut, :text
  end
end
