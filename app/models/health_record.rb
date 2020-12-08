class HealthRecord < ApplicationRecord
  validates :type, presence: true
  belongs_to :pet
  has_many_attached :documents
end
