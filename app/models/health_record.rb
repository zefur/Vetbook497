class HealthRecord < ApplicationRecord
  validates :type, presence: true
  belongs_to :pet
end
