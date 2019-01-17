class Field < ApplicationRecord
  belongs_to :club

  validates :price, presence: true
  validates :status, inclusion: { in: ["Free", "Pending", "Booked"] }
  validates :field_number, presence: true, uniqueness: true
end
