class UsersCollab < ApplicationRecord
  belongs_to :users
  belongs_to :collabs
end
