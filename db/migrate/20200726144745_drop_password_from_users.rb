class DropPasswordFromUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :password
  end

  def down

  end
end
