class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :dob
      t.string :breed
      t.string :species
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.integer :gender, default: 0

      t.timestamps
    end
  end
end
