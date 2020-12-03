class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :vet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
