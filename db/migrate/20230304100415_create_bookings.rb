class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :pickup_date
      # t.time :pickup_time
      t.datetime :delivery_date
      # t.time :delivery_time
      t.integer :total_price
      t.string :status
      t.references :user, null: false, foreign_key: true
      # t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
