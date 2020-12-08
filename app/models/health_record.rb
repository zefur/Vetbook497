class HealthRecord < ApplicationRecord
  validates :type, presence: true
  belongs_to :pet
  has_one_attached :document
end
