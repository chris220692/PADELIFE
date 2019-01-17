class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.boolean :outdoor, default: true
      t.integer :price
      t.string :status, default: "Free"
      t.integer :field_number
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
