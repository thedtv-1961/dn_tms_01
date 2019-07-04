class Subject < ApplicationRecord
  has_many :course_subjects
  has_many :subject_tasks

  validates :name, presence: true,
    length: {maximum: Settings.name_length_maximum}

  validates :description, presence: true,
    length: {maximum: Settings.content_text_max_length}

  mount_uploader :picture, PictureUploader

  scope :newest, ->{order id: :desc}
end
