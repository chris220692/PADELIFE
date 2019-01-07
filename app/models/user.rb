class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :player
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :category, presence: true, inclusion: { in: ["Player", "Club", "Teacher"] }
end
