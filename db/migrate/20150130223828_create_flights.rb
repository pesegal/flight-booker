class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :start_airport_id
      t.integer :end_airport_id
      t.date :departure
      t.integer :duration

      t.timestamps null: false
    end
  end
end
