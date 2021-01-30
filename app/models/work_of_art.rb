class WorkOfArt < ApplicationRecord
  belongs_to :user
  belongs_to :collab

  has_many :work_of_art_favorites, dependent: :destroy

  validates :name, presence: true


end
