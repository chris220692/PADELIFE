class Teacher < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, inclusion: { in: (12..99) }
  mount_uploader :photo, PhotoUploader
  validates :city, presence: true
  validates :zip, presence: true
  validates :gender, presence: true, inclusion: { in: ["Male", "Female"] }
end
