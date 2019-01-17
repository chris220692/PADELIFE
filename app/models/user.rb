class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :teacher
  has_one :club
  has_one :player

  has_many :fields, through: :club
  has_many :reservations
  has_many :player_reviews, dependent: :destroy
  has_many :teacher_reviews, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :category, presence: true, inclusion: { in: ["Player", "Club", "Teacher"] }
  validates :name, presence: true
end
