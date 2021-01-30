class CreateUsersCollabs < ActiveRecord::Migration[6.0]
  def change
    create_table :users_collabs do |t|
      t.references :users, null: false, foreign_key: true
      t.references :collabs, null: false, foreign_key: true

      t.timestamps
    end
  end
end
