class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :vet, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.date :booking_date
      t.time :booking_time

      t.timestamps
    end
  end
end
