class Collab < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :users_collabs, dependent: :destroy
  has_many :users, through: :users_collabs, dependent: :destroy
end
