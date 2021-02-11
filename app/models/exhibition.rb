class Exhibition < ApplicationRecord
  belongs_to :collab
  has_many :users, through: :users_collabs

  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: ["visual", "sculpture", "performance", "music"] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
