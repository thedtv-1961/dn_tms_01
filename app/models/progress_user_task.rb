class ProgressUserTask < ApplicationRecord
  belongs_to :subject_task
  belongs_to :subject_user
end
