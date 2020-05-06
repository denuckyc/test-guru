class AddAuthorIdToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :integer
  end
end
