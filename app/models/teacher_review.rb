class TeacherReview < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates :comment, presence: true
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
