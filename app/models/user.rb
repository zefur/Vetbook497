class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :pets, dependent: :destroy
  has_many :vets
  has_one_attached :photo

  def change
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
