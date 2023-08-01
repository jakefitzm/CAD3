class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.date :date
      t.time :time
      t.integer :size
      t.string :note

      t.timestamps
    end
  end
end
