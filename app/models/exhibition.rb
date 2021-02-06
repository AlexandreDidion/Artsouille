class Exhibition < ApplicationRecord
  belongs_to :collab
  # has_many :users, through: :collab

  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: ["visual", "sculpture", "performance", "music"] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
end
