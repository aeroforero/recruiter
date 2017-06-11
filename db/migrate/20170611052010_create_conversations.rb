class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.date :date
      t.text :summary
      t.text :full_detail
      t.string :location
      t.integer :connections_id

      t.timestamps

    end
  end
end
