class Player < ApplicationRecord
  belongs_to :user
  has_many :player_reviews
  validates :user_id, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, inclusion: { in: (12..99) }
  validates :level, presence: true, inclusion: { in: ["Beginner", "Elementary ", "Intermediate", "Advanced", "Expert"] }
  mount_uploader :photo, PhotoUploader
  validates :city, presence: true
  validates :zip, presence: true
  validates :gender, presence: true, inclusion: { in: ["Male", "Female"] }
end
