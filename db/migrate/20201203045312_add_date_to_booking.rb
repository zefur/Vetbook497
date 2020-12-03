class AddDateToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date, :date 
    add_column :bookings, :time, :time 
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
