class ChangeColumnNullWorkOfArtsCollabId < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:work_of_arts, :collab_id, true)
  end
end
