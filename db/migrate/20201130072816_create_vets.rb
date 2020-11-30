class CreateVets < ActiveRecord::Migration[6.0]
  def change
    create_table :vets do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :speciality
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
