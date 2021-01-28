class Collab < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :users_collab, dependent: :destroy
end
