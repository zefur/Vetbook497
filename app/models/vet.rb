class Vet < ApplicationRecord
  validates :first_name, :last_name, :speciality, :bio, presence: true
  belongs_to :clinic
  has_many :bookings
  has_one_attached :photo
end
