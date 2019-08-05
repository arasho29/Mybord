class AddIntroduceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduce, :string, foreign_key: true, index: true
  end
end
