class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM posts;'
    add_reference :posts, :user, foreign_key: true, index: true
  end

  def down
    remove_foreign_key :posts, :users
    remove_reference :posts, :user, index: true
  end
end
