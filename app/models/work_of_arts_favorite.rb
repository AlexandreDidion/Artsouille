class WorkOfArtsFavorite < ApplicationRecord
  belongs_to :work_of_art, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
