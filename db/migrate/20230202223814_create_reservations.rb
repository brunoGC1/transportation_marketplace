class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :transportation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
