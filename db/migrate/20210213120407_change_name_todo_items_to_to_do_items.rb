class ChangeNameTodoItemsToToDoItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :todo_items, :to_do_items
  end
end
