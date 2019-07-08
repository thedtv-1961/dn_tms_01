class Course < ApplicationRecord
  enum duration_types: {hour: 0, day: 1, month: 2}

  # has_many :course_users
  has_many :course_subjects, dependent: :destroy

  accepts_nested_attributes_for :course_subjects, allow_destroy: true

  validates :name, presence: true,
    length: {maximum: Settings.name_length_maximum}
  validates :description, presence: true,
    length: {maximum: Settings.content_text_max_length}
  validates :duration, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: Settings.duration_minimun,
      less_than_or_equal_to: Settings.duration_maximum
    }

  mount_uploader :picture, PictureUploader

  scope :newest, ->{order id: :desc}

  class << self
    def duration_types_i18n
      Hash[Course.duration_types
                 .map{|k, v| [I18n.t("course.duration_type.#{k}"), v]}]
    end
  end
end
