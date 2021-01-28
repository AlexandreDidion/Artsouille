class WorkOfArt < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :collab

  validates :name, presence: true
end
