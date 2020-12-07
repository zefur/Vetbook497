class Pet < ApplicationRecord
  belongs_to :user
  enum gender: {male: 0, female:1}
  validates :name, :gender, :species, presence: true
  has_many :bookings
  has_many :health_records
  has_one_attached :photo
end
