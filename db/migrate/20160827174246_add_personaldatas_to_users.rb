class AddPersonaldatasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :firstname, :string
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :dayofbirth, :date
  end
end
