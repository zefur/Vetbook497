class Booking < ApplicationRecord
  belongs_to :vet
  belongs_to :pet
  validates: :booking_date, :booking_time, presence :true
end
