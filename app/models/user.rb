class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # before_create do
  #   self.fullname = "#{first_name} #{last_name}"
  # end
  has_many :pets
  has_many :vets
end
