class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id

      t.timestamps null: false
    end
    add_column :posts, :brouillon, :boolean
  end
end
