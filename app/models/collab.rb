class Collab < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :user_collab_relationships, dependent: :destroy
  has_many :users, through: :user_collab_relationships
  has_many :exhibitions
  has_many :to_dos, dependent: :destroy
  has_one_attached :photo
end
