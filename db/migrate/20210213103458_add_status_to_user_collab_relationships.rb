class AddStatusToUserCollabRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :user_collab_relationships, :status, :integer, default: 0
  end
end
