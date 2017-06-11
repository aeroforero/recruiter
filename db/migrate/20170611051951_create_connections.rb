class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone
      t.string :email
      t.date :birthdate
      t.string :linkedin
      t.integer :user_id

      t.timestamps

    end
  end
end
