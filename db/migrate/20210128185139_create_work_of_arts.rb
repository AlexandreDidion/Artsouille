class CreateWorkOfArts < ActiveRecord::Migration[6.0]
  def change
    create_table :work_of_arts do |t|
      t.string :name
      t.text :description
      t.datetime :creation_date
      t.references :user, null: false, foreign_key: true
      t.references :collab, foreign_key: true

      t.timestamps
    end
  end
end
