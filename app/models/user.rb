class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :work_of_arts, dependent: :destroy
  has_many :users_collab, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
