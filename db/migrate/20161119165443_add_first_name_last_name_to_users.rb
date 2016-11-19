class AddFirstNameLastNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, required: true
    add_column :users, :last_name, :string, required: true
  end
end
