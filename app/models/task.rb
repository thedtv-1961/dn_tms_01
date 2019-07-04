class Task < ApplicationRecord
  has_many :subject_tasks

  validates :name, presence: true,
            length: {maximum: Settings.name_length_maximum}

  scope :newest, ->{order id: :desc}
end
