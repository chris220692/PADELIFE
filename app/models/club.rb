class Club < ApplicationRecord
  belongs_to :user
  has_many :fields
  has_many :club_reviews

  validates :name, presence: true
  validates :street, presence: true
  validates :user_id, presence: true, uniqueness: true
  validates :street_number, presence: true
  validates :city, presence: true
  validates :zip, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end
