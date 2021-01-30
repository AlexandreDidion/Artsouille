class WorkOfArtsFavorite < ApplicationRecord
  belongs_to :work_of_art
  belongs_to :user
end
