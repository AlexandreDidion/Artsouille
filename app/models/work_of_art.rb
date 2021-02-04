class WorkOfArt < ApplicationRecord
  belongs_to :user
  belongs_to :collab

  has_many :work_of_arts_favorites, dependent: :destroy

  validates :name, presence: true
end
