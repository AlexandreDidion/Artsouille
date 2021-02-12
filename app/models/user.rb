class User < ApplicationRecord
  acts_as_favoritor
  validates :username, presence: true, uniqueness: true
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :work_of_arts_favorites, dependent: :destroy
  has_many :work_of_arts, dependent: :destroy
  has_many :user_collab_relationships, dependent: :destroy
  has_many :collabs, through: :user_collab_relationships, dependent: :destroy
  has_many :exhibitions, through: :collabs

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :following_users

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :senders, through: :received_conversations
  has_many :receivers, through: :authored_conversations
  has_many :messages, dependent: :destroy

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
