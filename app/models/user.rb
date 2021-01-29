class User < ApplicationRecord
  has_many :work_of_art_favorites, dependent: :destroy
  has_many :work_of_arts, dependent: :destroy
  has_many :collabs, through: :users_collabs, dependent: :destroy
  
  validates :art_type, inclusion: { in: ["abstract", "animation", "calligraphy", "design", "digital", "musician", "painter", "performer", "photography", "sculupture", "visual effects", "emerging"]}
  validates :username, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :following_users
end
