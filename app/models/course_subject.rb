class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :subject_users, dependent: :destroy
end
