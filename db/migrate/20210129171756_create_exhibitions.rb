class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :category
      t.string :address
      t.references :collab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
