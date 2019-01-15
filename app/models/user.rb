class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :teacher
  has_one :club
  has_one :player
  has_many :teacher_reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :category, presence: true, inclusion: { in: ["Player", "Club", "Teacher"] }
  validates :name, presence: true
end
