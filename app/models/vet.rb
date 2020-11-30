class Vet < ApplicationRecord
  validates :first_name, :last_name, :speciality, :bio, presence: true
  belongs_to :clinic
end
