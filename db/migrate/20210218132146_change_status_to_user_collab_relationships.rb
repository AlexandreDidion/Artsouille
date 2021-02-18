class ChangeStatusToUserCollabRelationships < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user_collab_relationships, :status, from: 1, to: 0
  end
end
