class AddResetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reset, :string
    add_column :users, :reset_confirmation, :string
  end
end
