class AddHeaderToPost < ActiveRecord::Migration
  def change
    add_column :posts, :header, :string
  end
end
