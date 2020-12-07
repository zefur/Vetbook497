class AddTypeToHealthRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :health_records, :type, :string
    change_column :health_records, :vaccination_type, :string
    
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
