class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, id: false do |t|
      t.uuid       :id, primary_key: true
      t.string     :title, limit: 255
      t.text       :content, limit: 4294967295
      t.integer    :access, limit: 1, index: true
      t.uuid :blog_id, index: true
      t.uuid :user_id, index: true

      t.timestamps null: false
    end
  end
end
