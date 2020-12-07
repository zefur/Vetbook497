class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    remove_column :health_records, :vaccination_date
  end
end
