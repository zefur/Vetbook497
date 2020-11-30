class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :DOB
      t.string :species
      t.string :breed
      t.text :notes
      t.integer :gender

      t.timestamps
    end
  end
end
