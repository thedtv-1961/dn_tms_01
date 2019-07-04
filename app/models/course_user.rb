class CourseUser < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :subject_users, dependent: :destroy
end
