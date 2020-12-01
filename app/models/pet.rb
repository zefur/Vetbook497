class Pet < ApplicationRecord
  enum gender: [:male, :female]
  validates :name, :gender, :species, presence: true
  belongs_to :user
  has_many :bookings
end
