# frozen_string_literal: true

class AddHeaderToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :header, :string
  end
end
