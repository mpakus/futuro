class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs, id: false do |t|
      t.uuid   :id, primary_key: true
      t.string :name, limit: 255
      t.string :uri, limit: 255, index: true
      t.text   :description
      t.string :image
      t.integer :variant
      t.uuid    :user_id, index: true
      t.text   :settings
      t.timestamps null: false
    end
  end
end
