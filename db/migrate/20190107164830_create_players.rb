class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :description
      t.string :level
      t.string :photo
      t.string :city
      t.integer :zip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
