class Booking < ApplicationRecord
  belongs_to :vet
  belongs_to :pet
end
