class CreatePassingTests < ActiveRecord::Migration[6.0]
  def change
    create_table :passing_tests do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :passing

      t.timestamps
    end
  end
end
