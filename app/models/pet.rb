class Pet < ApplicationRecord
  validates :name, :gender, :species, presence: true
  belongs_to :user
  has_many :bookings
end
