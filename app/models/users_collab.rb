class UsersCollab < ApplicationRecord
  belongs_to :user
  belongs_to :collab
end
