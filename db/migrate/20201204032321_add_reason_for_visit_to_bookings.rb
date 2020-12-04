class AddReasonForVisitToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :reason_for_visit, :string
  end
end
