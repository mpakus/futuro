# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uri
      t.string :token, limit: 24, index: true, uniq: true

      t.timestamps null: false
    end
  end
end
