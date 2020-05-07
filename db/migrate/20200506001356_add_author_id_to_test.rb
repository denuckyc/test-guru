class AddAuthorIdToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :integer, index: true, foreign_key: true
  end
end
