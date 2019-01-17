class CreateClubReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :club_reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
