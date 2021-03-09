class UserCollabRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :collab

  enum status: { rejected: 0, pending: 1, accepted: 2 }
end
