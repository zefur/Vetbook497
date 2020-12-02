class CreateHealthRecord < ActiveRecord::Migration[6.0]
  def change
    create_table :health_records do |t|
      t.date :diagnosis_date
      t.text :diagnosis
      t.text :treatment
      t.integer :vaccination_type
      t.integer :vaccination_date
      t.references :pet, null: false, foreign_key: true
      t.boolean :is_vaccination
    end
  end
end
