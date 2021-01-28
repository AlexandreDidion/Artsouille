class User < ApplicationRecord
  validates :art_type, inclusion: { in: ["abstract", "animation", "calligraphy", "design", "digital", "musician", "painter", "performer", "photography", "sculupture", "visual effects", "emerging"]} 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
