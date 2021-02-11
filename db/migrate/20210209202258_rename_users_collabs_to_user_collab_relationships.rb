class RenameUsersCollabsToUserCollabRelationships < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_collabs, :user_collab_relationships
  end
end
