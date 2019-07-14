class CourseSubject < ApplicationRecord
  # Enums
  enum status_types: {init: 0, learning: 1, finish: 2}

  # Relationships
  belongs_to :course
  belongs_to :subject
end
