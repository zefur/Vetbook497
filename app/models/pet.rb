class Pet < ApplicationRecord
  validates :name, :gender, :species, presence: true
  belongs_to :user
end
