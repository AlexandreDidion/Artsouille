class Collab < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
