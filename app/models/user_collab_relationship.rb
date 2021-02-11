class UserCollabRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :collab
end
