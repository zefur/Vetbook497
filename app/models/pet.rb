class Pet < ApplicationRecord
  enum gender: [:male, :female]
  validates :name, :gender, :species, presence: true
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
end
