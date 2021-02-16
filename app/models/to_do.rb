class ToDo < ApplicationRecord
  belongs_to :collab
  has_many :to_do_items, dependent: :destroy
end
