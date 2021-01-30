class CreateWorkOfArtsFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :work_of_arts_favorites do |t|
      t.references :work_of_art, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
