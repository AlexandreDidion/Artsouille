class WorkOfArt < ApplicationRecord
  belongs_to :user
  belongs_to :collab

  validates :name, presence: true
end
