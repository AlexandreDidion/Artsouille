class WorkOfArt < ApplicationRecord
  acts_as_favoritable
  belongs_to :user
  belongs_to :collab, optional: true

  # has_many :work_of_arts_favorites, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
end
