class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
end
