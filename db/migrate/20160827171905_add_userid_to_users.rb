class AddUseridToUsers < ActiveRecord::Migration
  def change
    remove_column :comments, :name
    add_column :posts, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
