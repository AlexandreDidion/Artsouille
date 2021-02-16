class CreateToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.text :content
      t.references :collab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
