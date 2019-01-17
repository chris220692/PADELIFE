class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :starting_hour
      t.datetime :ending_hour
      t.references :user, foreign_key: true
      t.references :field, foreign_key: true

      t.timestamps
    end
  end
end
