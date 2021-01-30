class CreateUsersCollabs < ActiveRecord::Migration[6.0]
  def change
    create_table :users_collabs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :collab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
