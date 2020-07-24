class DropPassingTests < ActiveRecord::Migration[6.0]
  def change
    drop_table :passing_tests
  end
end
