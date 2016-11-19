class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name, required: true
      t.date :dob
      t.string :species, required: true
      t.string :breed
      t.string :microchip
      t.string :primary_vet
      t.boolean :fixed
      t.string :picture
      t.text :notes
      t.text :gender
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
