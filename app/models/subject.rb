class Subject < ApplicationRecord
  has_many :course_subjects, dependent: :destroy
  has_many :subject_tasks, dependent: :destroy

  accepts_nested_attributes_for :course_subjects, allow_destroy: true
  accepts_nested_attributes_for :subject_tasks, allow_destroy: true

  validates :name, presence: true,
    length: {maximum: Settings.name_length_maximum}

  validates :description, presence: true,
    length: {maximum: Settings.content_text_max_length}

  mount_uploader :picture, PictureUploader

  scope :newest, ->{order id: :desc}
end
