class Vet < ApplicationRecord
  belongs_to :user
  
    validates :first_name, :last_name, :speciality, :bio, presence: true
   
    has_many :bookings
    has_one_attached :photo
  
end
