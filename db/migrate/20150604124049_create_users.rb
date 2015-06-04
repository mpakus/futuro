class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.uuid   :id, primary_key: true
      t.string :name
      t.string :uri

      t.timestamps null: false
    end
  end
end
