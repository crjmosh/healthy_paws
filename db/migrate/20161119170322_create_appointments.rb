class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :title, required: true
      t.date :date, required: true
      t.time :time
      t.text :location
      t.text :notes
      t.belongs_to :pet, foreign_key: true

      t.timestamps
    end
  end
end
