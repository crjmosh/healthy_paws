class CreateMedicals < ActiveRecord::Migration[5.0]
  def change
    create_table :medicals do |t|
      t.string :title, required: true
      t.date :date, required: true
      t.text :notes

      t.timestamps
    end
  end
end
