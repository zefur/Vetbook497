class AddDateToVaccination < ActiveRecord::Migration[6.0]
  def change
    add_column :health_records, :vaccination_date, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
