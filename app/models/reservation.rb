class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :field

  validates :strating_hour, uniqueness: true

  def set_end_date
    self.end_date = self.end_date.change(day: start_date.day, month: start_date.month, year: start_date.year, hour: end_date.hour, min: end_date.min)
    self.save!
  end
end
