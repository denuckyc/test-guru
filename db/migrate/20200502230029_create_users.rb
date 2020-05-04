class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 64
      t.string :password, limit: 64

      t.timestamps
    end
  end
end
