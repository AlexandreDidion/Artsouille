class RemoveContentFromToDos < ActiveRecord::Migration[6.0]
  def change
    remove_column :to_dos, :content
  end
end
