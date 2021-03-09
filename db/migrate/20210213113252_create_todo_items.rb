class CreateTodoItems < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_items do |t|
      t.string :content
      t.references :to_do, null: false, foreign_key: true

      t.timestamps
    end
  end
end
