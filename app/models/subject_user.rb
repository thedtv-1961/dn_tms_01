class SubjectUser < ApplicationRecord
  belongs_to :course_user
  belongs_to :course_subject
  has_many :progress_user_tasks, dependent: :destroy
end
