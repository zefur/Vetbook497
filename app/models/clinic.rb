class Clinic < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates: :name, :address, :phone_number, :email, :owner_name, presence :true 
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :vets
end
